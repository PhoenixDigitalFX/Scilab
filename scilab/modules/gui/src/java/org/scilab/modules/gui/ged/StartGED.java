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

package org.scilab.modules.gui.ged;

import org.scilab.modules.gui.editor.Editor;
import org.scilab.modules.gui.editor.EditorManager;

/**
 * Manages the action of the buttons on the toolbar and menubar.
 *
 * @author Marcos CARDINOT <mcardinot@gmail.com>
 */
public class StartGED {

    public static boolean enableNewGed = false;

    /**
    * Initializes the lightGED.
    */
    public static void quickGED(Integer uid) {
        if (enableNewGed) {
            Editor instanceEditor = EditorManager.getFromUid(uid);
            instanceEditor.onClickGED();
        }
    }
}
