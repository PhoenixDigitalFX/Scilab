/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 2013 - Marcos CARDINOT
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
package org.scilab.modules.gui.ged.graphic_objects.figure;

import javax.swing.JPanel;
import org.scilab.modules.gui.ged.MessagesGED;
import org.scilab.modules.gui.ged.graphic_objects.properties.ContouredObject;
import org.scilab.modules.gui.ged.graphic_objects.properties.Figure;
import org.scilab.modules.gui.ged.graphic_objects.SimpleSection;

/**
* Construction and startup of all components of the section: Style/Appeareance.
* @author Marcos CARDINOT <mcardinot@gmail.com>
*/
public class Style extends SimpleSection {
    private JPanel sectionPanel;
    private static Style instance;
    private ContouredObject contouredObject = new ContouredObject();
    private Figure figure = new Figure();

    /**
    * Receives and passes the objectID to the parent class.
    * @param objectID Enters the identification of object.
    */
    public Style(Integer objectID) {
        super(MessagesGED.style_appearance, "figure");
        instance = this;
        sectionPanel = getSectionPanel();
        initComponents(objectID);
    }

    /**
     * Get instance
     * @return instance
     */
    public static Style getInstance() {
        return instance;
    }

    /**
    * Initialize the Components.
    */
    @Override
    public final void initComponents(Integer objectID) {
        int row = 0;
        final int leftmargin = 16; //to inner components
        int column = 0; //first column

        //Components of the property: Background Color.
        contouredObject.backgroundColor(sectionPanel, row++, column, leftmargin, objectID, objectID);

        //Components of the property: Color Map.
        //not implemented yet

        //Components of the property: Pixel Drawing Mode
        figure.pixelDrawingMode(sectionPanel, row++, column, leftmargin, objectID);

        //Components of the property: Rotation Style
        figure.rotationStyle(sectionPanel, row++, column, leftmargin, objectID);
    }
}