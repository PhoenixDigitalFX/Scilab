/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 - Marcos CARDINOT
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

package org.scilab.modules.gui.ged.actions;

import javax.swing.KeyStroke;

import org.scilab.modules.commons.gui.ScilabKeyStroke;
import org.scilab.modules.gui.bridge.menuitem.SwingScilabMenuItem;
import org.scilab.modules.gui.bridge.tab.SwingScilabDockablePanel;
import org.scilab.modules.gui.events.callback.CommonCallBack;
import org.scilab.modules.gui.ged.Inspector;
import org.scilab.modules.gui.ged.MessagesGED;
import org.scilab.modules.gui.menuitem.MenuItem;
import org.scilab.modules.gui.menuitem.ScilabMenuItem;
import org.scilab.modules.gui.utils.ClosingOperationsManager;

/**
 * Close action
 *
 * @author Marcos CARDINOT <mcardinot@gmail.com>
 */
public class CloseAction extends CommonCallBack {

    private static final KeyStroke KEY = ScilabKeyStroke.getKeyStroke("OSSCKEY W");

    /**
     * Default constructor
     */
    public CloseAction() {
        super(null);
    }

    /**
     * @return a menuitem associated with this action
     */
    public static MenuItem createMenu() {
        MenuItem item = ScilabMenuItem.createMenuItem();
        SwingScilabMenuItem swingItem = (SwingScilabMenuItem) item.getAsSimpleMenuItem();
        swingItem.setAction(new CloseAction());
        swingItem.setText(MessagesGED.close);
        swingItem.setAccelerator(KEY);

        return item;
    }

    /**
     * {@inheritDoc}
     */
    public void callBack() {
        Inspector.getInspector().close();
    }
}