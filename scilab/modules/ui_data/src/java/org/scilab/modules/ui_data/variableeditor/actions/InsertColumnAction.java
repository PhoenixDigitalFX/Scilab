/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2011 - DIGITEO - Calixte DENIZET
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

package org.scilab.modules.ui_data.variableeditor.actions;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JMenuItem;
import javax.swing.JTable;

import org.scilab.modules.commons.gui.FindIconHelper;
import org.scilab.modules.commons.gui.ScilabLAF;
import org.scilab.modules.gui.events.callback.CommonCallBack;
import org.scilab.modules.ui_data.datatable.SwingEditvarTableModel;
import org.scilab.modules.ui_data.variableeditor.TableVariableEditor;

/**
 * Set Precision Action class
 * @author Calixte DENIZET
 */
@SuppressWarnings(value = { "serial" })
public final class InsertColumnAction extends CommonCallBack {

    private final JTable table;

    /**
     * Constructor
     * @param editor the editor
     * @param name the name of the action
     */
    public InsertColumnAction(JTable table, String name) {
        super(name);
        this.table = table;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void callBack() {
        int[] rows = table.getSelectedRows();
        int column = ((TableVariableEditor) table).getPopupColumn();
        SwingEditvarTableModel model = (SwingEditvarTableModel) table.getModel();
        model.insertColumn(column);
        table.setColumnSelectionInterval(column, column);
        for (int i = 0; i < rows.length; i++) {
            table.addRowSelectionInterval(rows[i], rows[i]);
        }
    }

    /**
     * Create a button for a tool bar
     * @param editor the associated editor
     * @param title tooltip for the button
     * @return the button
     */
    public static JButton createButton(JTable table, String title) {
        JButton button = new JButton();
        ScilabLAF.setDefaultProperties(button);
        button.addActionListener(new InsertColumnAction(table, title));
        button.setToolTipText(title);
        ImageIcon imageIcon = new ImageIcon(FindIconHelper.findIcon("short"));
        button.setIcon(imageIcon);

        return button;
    }

    /**
     * Create a menu item
     * @param editor the associated editor
     * @param title the menu title
     * @return the menu item
     */
    public static JMenuItem createMenuItem(JTable table, String title) {
        JMenuItem mi = new JMenuItem(title);
        mi.addActionListener(new InsertColumnAction(table, title));

        return mi;
    }
}
