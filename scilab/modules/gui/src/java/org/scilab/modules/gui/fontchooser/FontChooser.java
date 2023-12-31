/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2008 - INRIA - Vincent COUVERT
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

package org.scilab.modules.gui.fontchooser;

import java.awt.Font;

import org.scilab.modules.gui.uielement.UIElement;

/**
 * Interface for font chooser for Scilab
 * @author Vincent COUVERT
 */
public interface FontChooser extends UIElement {

    /**
     * Gets this Bridge component object
     * @return this Bridge component object
     */
    SimpleFontChooser getAsSimpleFontChooser();

    /**
     * Retrieve the selected font, or null
     * @return the selected font
     */
    Font getSelectedFont();

    /**
     * Set the default font name
     * @param fontName the default font name
     */
    void setDefaultFontName(String fontName);

    /**
     * Set the default font size
     * @param fontSize the default font size
     */
    void setDefaultFontSize(int fontSize);

    /**
     * Set the default font bold attribute
     * @param bold the default font bold attribute
     */
    void setDefaultBold(boolean bold);

    /**
     * Set the default font italic attribute
     * @param italic the default font italic attribute
     */
    void setDefaultItalic(boolean italic);

    /**
     * Display the font chooser and wait for a user input
     */
    void displayAndWait();
}
