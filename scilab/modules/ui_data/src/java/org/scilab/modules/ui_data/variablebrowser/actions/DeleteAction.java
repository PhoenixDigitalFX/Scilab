/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2010 - DIGITEO - Vincent COUVERT
 * Copyright (C) 2013 - S/E - Sylvestre Ledru
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

package org.scilab.modules.ui_data.variablebrowser.actions;

import static org.scilab.modules.action_binding.highlevel.ScilabInterpreterManagement.asynchronousScilabExec;

import javax.swing.ImageIcon;
import javax.swing.JButton;

import org.scilab.modules.action_binding.highlevel.ScilabInterpreterManagement.InterpreterException;
import org.scilab.modules.commons.gui.FindIconHelper;
import org.scilab.modules.commons.gui.ScilabLAF;
import org.scilab.modules.gui.bridge.menuitem.SwingScilabMenuItem;
import org.scilab.modules.gui.events.callback.CommonCallBack;
import org.scilab.modules.gui.menuitem.MenuItem;
import org.scilab.modules.gui.menuitem.ScilabMenuItem;
import org.scilab.modules.ui_data.BrowseVar;
import org.scilab.modules.ui_data.utils.UiDataMessages;
import org.scilab.modules.ui_data.variablebrowser.SwingScilabVariableBrowser;

/**
 * Manage Delete Actions
 * @author Vincent COUVERT
 */
public final class DeleteAction extends CommonCallBack {

    private static final long serialVersionUID = 1L;

    private static ImageIcon icon = new ImageIcon(FindIconHelper.findIcon("edit-delete"));

    private static final char MNEMONIC = 'D';

    private static final String KEY = "DELETE";
    private static final String SUPPR = "Suppr";

    private final SwingScilabVariableBrowser variableBrowser;

    /**
     * Constructor
     */
    public DeleteAction(SwingScilabVariableBrowser variableBrowser) {
        super("");
        this.variableBrowser = variableBrowser;
    }

    /**
     * Create a button for a tool bar
     * @param title tooltip for the button
     * @return the button
     */
    public static JButton createButton(SwingScilabVariableBrowser variableBrowser, String title) {
        JButton button = new JButton();
        ScilabLAF.setDefaultProperties(button);
        button.addActionListener(new DeleteAction(variableBrowser));
        button.setToolTipText(title);
        button.setIcon(icon);

        return button;
    }

    /**
     * Create the associated menu
     * @return the menu
     */
    public MenuItem createMenuItem() {
        MenuItem menuItem = ScilabMenuItem.createMenuItem();
        menuItem.setText(UiDataMessages.DELETE + " '" + getSelectedVariable() + "'");
        menuItem.setMnemonic(MNEMONIC);
        menuItem.setCallback(this);
        ((SwingScilabMenuItem) menuItem.getAsSimpleMenuItem()).setIcon(icon);
        return menuItem;
    }

    /**
     * Action!
     * @see org.scilab.modules.gui.events.callback.CallBack#callBack()
     */
    @Override
    public void callBack() {
        try {
            asynchronousScilabExec(null, "clear('" + getSelectedVariable() + "'); updatebrowsevar()");
        } catch (InterpreterException e1) {
            System.err.println("An error in the interpreter has been catched: " + e1.getLocalizedMessage());
        }
    }

    private String getSelectedVariable() {
        int clickedRow = variableBrowser.getTable().getSelectedRow();
        // Does nothing if no variable selected
        if (clickedRow != -1) {
            return variableBrowser.getTable().getValueAt(clickedRow, BrowseVar.NAME_COLUMN_INDEX).toString();
        }
        return "";
    }
}
