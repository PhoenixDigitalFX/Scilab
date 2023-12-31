/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2011 - DIGITEO - Calixte DENIZET
 * Copyright (C) 2020 - ESI Group - Clement DAVID
 *
 * Copyright (C) 2012 - 2016 - Scilab Enterprises
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */
package org.scilab.modules.ui_data.filebrowser;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.StandardWatchEventKinds;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import java.nio.file.Watchable;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import javax.swing.SwingWorker;
import org.scilab.modules.ui_data.utils.UiDataMessages;

/**
 * The tree table model abstract implementation
 *
 * @author Calixte DENIZET
 */
public class ScilabFileBrowserModel extends AbstractScilabTreeTableModel
    implements ScilabTreeTableModel {

    private static final String[] names = {
        UiDataMessages.NAME_COLUMN, UiDataMessages.SIZE_COLUMN,
        UiDataMessages.TYPE_COLUMN, UiDataMessages.LASTMODIF_COLUMN
    };

    private static final Class[] types = {
        ScilabTreeTableModel.class, FileSize.class, String.class, Date.class
    };

    private static final FileSize MINUSONE = new FileSize(-1);

    /** Will trigger a model update on file creation/deletion */
    private final class DirWatcher extends SwingWorker<Void, WatchEvent<Path>> {

        public DirWatcher(FileNode root) {
            watchDirectories(new Object[] {root});
        }

        @SuppressWarnings("unchecked")
        @Override
        protected Void doInBackground() throws Exception {
            for (; ; ) {
                WatchKey key = watcher.take();
                List<FileNode> treePath = new ArrayList<>();
                FileNode fn = null;

                // identify the associated file and publish for update on EDT
                Watchable wa = key.watchable();
                if (wa instanceof Path) {
                    Path p = (Path) wa;
                    Path r = ((FileNode) root).file.toPath().relativize(p);

                    // reconstruct a TreePath
                    treePath.add((FileNode) root);
                    Iterator<Path> it = r.iterator();
                    while (it.hasNext()) {
                        Path name = it.next();
                        FileNode[] children = (FileNode[]) treePath.get(treePath.size() - 1).getChildren();
                        for (FileNode node : children) {
                            if (node.name.equals(name.toString())) {
                                treePath.add(node);
                                break;
                            }
                        }
                    }

                    // in case of directory deletion, only reset the hierarchy up to an
                    // existing directory
                    treePath = treePath.stream().filter(n -> n.file.exists()).collect(Collectors.toList());
                    if (treePath.isEmpty()) {
                        // if the root is remove then cancel the watcher
                        watcher.close();
                        watcher = null;
                        return null;
                    }

                    // retrieve the corresponding FileNode
                    fn = treePath.get(treePath.size() - 1);

                    // reset the children of the FileNode
                    fn.resetChildren();
                    Object[] children = fn.getChildren();

                    // on directory creation, add them to the watch list
                    watchDirectories(children);
                }

                // trigger a refresh on the EDT for the full treepath
                List<WatchEvent<?>> events = key.pollEvents();
                for (@SuppressWarnings("rawtypes") WatchEvent event : events) {
                    publish((WatchEvent<Path>) event);
                }

                // reinstall a watch on the directory
                key.reset();

            }
        }

        @Override
        protected void process(List<WatchEvent<Path>> chunks) {
            for (WatchEvent<Path> event : chunks) {
                Path path = event.context();
                // reload part of the model
                ScilabFileBrowserModel.this.fireTreeStructureChanged(this, new Path[] {path}, null, null);
            }
        }

        /**
         * append directories to be watched
         *
         * @param children file list
         */
        public void watchDirectories(Object[] children) {
            for (Object o : children) {
                if (!(o instanceof FileNode)) {
                    continue;
                }
                FileNode fn = (FileNode) o;
                if (fn.isFile) {
                    continue;
                }
                Path p = fn.file.toPath();
                try {
                    p.register(
                        watcher, StandardWatchEventKinds.ENTRY_CREATE, StandardWatchEventKinds.ENTRY_DELETE);
                } catch (IOException ex) {
                    ex.printStackTrace();
                    Logger.getLogger(SwingScilabTreeTable.class.getName()).log(Level.SEVERE, null, ex);
                    cancel(false);
                }
            }
        }
    }

    private int order = 1;
    private String baseDir = "";
    WatchService watcher;
    private DirWatcher dirWatcher;

    /** Default constructor */
    public ScilabFileBrowserModel() {
        super();

        try {
            // Setup watchers
            watcher = FileSystems.getDefault().newWatchService();
        } catch (IOException ex) {
            Logger.getLogger(SwingScilabTreeTable.class.getName()).log(Level.SEVERE, null, ex);
            watcher = null;
        }
    }

    /**
     * Set the base directory
     *
     * @param baseDir the base directory
     * @param stt the associated treetable component
     */
    public void setBaseDir(final String baseDir, final SwingScilabTreeTable stt) {
        this.baseDir = baseDir;
        SwingWorker worker =
        new SwingWorker<Void, Void>() {
            protected Void doInBackground() throws Exception {
                File f = new File(baseDir);
                setRoot(new FileNode(f, -1));
                File parentFile = f.getParentFile();
                if (parentFile != null) {
                    parent = new ParentNode(parentFile);
                } else {
                    parent = null;
                }

                return null;
            }

            protected void done() {
                if (!isCancelled()) {
                    stt.reload(ScilabFileBrowserModel.this);
                    stt.setDirRefresher(null, null);
                }
            }
        };
        stt.setDirRefresher(worker, ScilabFileBrowserModel.this);
        worker.execute();
    }

    public void setRoot(Object root) {
        super.setRoot(root);

        // watch for changes
        if (watcher != null) {
            if (dirWatcher != null) {
                dirWatcher.cancel(true);
            }
            dirWatcher = new DirWatcher((FileNode) root);
            dirWatcher.execute();
        }

        // Force the root to load its children in the SwingWorker thread rather than in
        // EDT
        watchDirectories(((FileNode) root).getChildren());
    }

    Object[] watchDirectories(Object[] objects) {
        if (watcher != null && dirWatcher != null && objects != null) {
            dirWatcher.watchDirectories(objects);
        }
        return objects;
    }

    /** @return the base directory of this model */
    public String getBaseDir() {
        return baseDir;
    }

    /**
     * Set the filter pattern
     *
     * @pat the pattern
     */
    public void setFilter(Pattern pat) {
        ((FileNode) root).setFilter(pat);
    }

    /**
     * @param node the node
     * @return the file associated with the node
     */
    protected File getFile(Object node) {
        FileNode fileNode = (FileNode) node;
        return fileNode.getFile();
    }

    /**
     * @param node the node
     * @return the children of this node
     */
    protected Object[] getChildren(Object node) {
        FileNode fileNode = (FileNode) node;
        FileNode[] raw = fileNode.getRawChildren();
        if (raw == null) {
            return watchDirectories(fileNode.getChildren());
        } else {
            return fileNode.getChildren();
        }
    }

    /**
     * @param node the node
     * @return the number of children of this node
     */
    public int getChildCount(Object node) {
        Object[] children = getChildren(node);
        int count = 0;
        if (children != null) {
            count = children.length;
        }

        if (parent == null || node != getRoot()) {
            return count;
        }
        return count + 1;
    }

    /**
     * @param node the node
     * @param i the child number
     * @return the child at position i
     */
    public Object getChild(Object node, int i) {
        Object ret;
        if (node == getRoot()) {
            if (parent == null) {
                ret = getChildren(node)[i];
            } else {
                if (i == 0) {
                    ret = parent;
                } else {
                    ret = getChildren(node)[i - 1];
                }
            }
        } else {
            ret = getChildren(node)[i];
        }

        return ret;
    }

    /**
     * @param node the node
     * @return true is this node is a leaf
     */
    public boolean isLeaf(Object node) {
        return node != getRoot() && ((FileNode) node).isLeaf();
    }

    /** {@inheritDoc} */
    public int getColumnCount() {
        // TODO : remove the comment and let the choice to the user to remove or not the
        // columns
        return 1; // names.length;
    }

    /** {@inheritDoc} */
    public String getColumnName(int column) {
        return names[column];
    }

    /** {@inheritDoc} */
    public Class getColumnClass(int column) {
        return types[column];
    }

    /** {@inheritDoc} */
    public Object getValueAt(Object node, int column) {
        File file = getFile(node);
        try {
            switch (column) {
                case 0:
                    return file.getName();
                case 1:
                    return file.isFile() ? new FileSize((int) file.length()) : MINUSONE;
                case 2:
                    if (file.isFile()) {
                        String ext = FileUtils.getFileExtension(file);
                        if (ext.isEmpty()) {
                            return UiDataMessages.FILE;
                        } else {
                            return String.format(UiDataMessages.FILETYPE, FileUtils.getFileExtension(file));
                        }
                    } else {
                        return UiDataMessages.DIRECTORY;
                    }
                case 3:
                    return new Date(file.lastModified());
            }
        } catch (SecurityException se) {
        }

        return null;
    }

    /** Inner class to represent the parent node of a file node */
    public static class ParentNode extends FileNode {

        /** {@inheritDoc} */
        public ParentNode(File f) {
            super(f, -1);
        }

        /** {@inheritDoc} */
        public boolean isLeaf() {
            return true;
        }

        /** {@inheritDoc} */
        public String toString() {
            return "..";
        }
    }

    /** Inner class to represent the size of file */
    public static class FileSize {

        int size;

        FileSize(int size) {
            this.size = size;
        }

        public String toString() {
            if (size < 0) {
                return "";
            }

            if (size >= 0 && size < 1000) {
                return size + " B";
            }

            DecimalFormat df = new DecimalFormat("#.#");
            if (size >= 1000 && size < 1000000) {
                return df.format(((float) size) / 1000f).toString() + " KB";
            }

            if (size >= 1000000 && size < 1000000000) {
                return df.format(((float) size) / 1000000f).toString() + " MB";
            }

            return df.format(((float) size) / 1000000000f).toString() + " GB";
        }
    }
}
