/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2009 - DIGITEO - Vincent COUVERT
 * Copyright (C) 2009 - DIGITEO - Clement DAVID
 * Copyright (C) 2011-2015 - Scilab Enterprises - Clement DAVID
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

package org.scilab.modules.xcos.palette.actions;

import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;

import org.scilab.modules.graph.ScilabGraph;
import org.scilab.modules.graph.actions.base.DefaultAction;
import org.scilab.modules.gui.menuitem.MenuItem;
import org.scilab.modules.xcos.palette.PaletteManager;
import org.scilab.modules.xcos.utils.XcosMessages;

/**
 * Close action for palettes tab
 */
@SuppressWarnings(value = { "serial" })
public class ClosePalettesAction extends DefaultAction {
    /** Name of the action */
    public static final String NAME = XcosMessages.CLOSE;
    /** Icon name of the action */
    public static final String SMALL_ICON = "";
    /** Mnemonic key of the action */
    public static final int MNEMONIC_KEY = KeyEvent.VK_W;
    /** Accelerator key for the action */
    public static final int ACCELERATOR_KEY = Toolkit.getDefaultToolkit()
            .getMenuShortcutKeyMask();

    /**
     * Constructor
     *
     * @param scilabGraph
     *            associated Scilab Graph
     */
    public ClosePalettesAction(ScilabGraph scilabGraph) {
        super(scilabGraph);
    }

    /**
     * Create the close menu for the menu bar
     *
     * @param scilabGraph
     *            associated Scilab Graph
     * @return the menu
     */
    public static MenuItem createMenu(ScilabGraph scilabGraph) {
        return createMenu(scilabGraph, ClosePalettesAction.class);
    }

    /**
     * @param e
     *            parameter
     * @see org.scilab.modules.graph.actions.base.DefaultAction#actionPerformed(java.awt.event.ActionEvent)
     */
    @Override
    public void actionPerformed(ActionEvent e) {
        PaletteManager.setVisible(false);
    }
}
