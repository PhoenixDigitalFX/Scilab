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
package org.scilab.modules.gui.ged.graphic_objects.polyline;

import javax.swing.JPanel;
import org.scilab.modules.gui.ged.graphic_objects.properties.ContouredObject;
import org.scilab.modules.gui.ged.graphic_objects.properties.GraphicObject;
import org.scilab.modules.gui.ged.graphic_objects.properties.Polyline;
import org.scilab.modules.gui.ged.graphic_objects.SimpleSection;
import org.scilab.modules.gui.ged.MessagesGED;

/**
* Construction and startup of all components of the section: Base Properties.
* @author Marcos CARDINOT <mcardinot@gmail.com>
*/
public class BaseProperties extends SimpleSection {
    private JPanel sectionPanel;
    private static BaseProperties instance;
    private ContouredObject contouredObject = new ContouredObject();
    private GraphicObject graphicObject = new GraphicObject();
    private Polyline polyline = new Polyline();

    /**
    * Initializes the properties and the icons of the buttons.
    * @param objectID Enters the identification of object.
    */
    public BaseProperties(Integer objectID) {
        super(MessagesGED.base_properties, "polyline");
        instance = this;
        sectionPanel = getSectionPanel();
        initComponents(objectID);
    }

    /**
     * Get instance
     * @return instance
     */
    public static BaseProperties getInstance() {
        return instance;
    }

    /**
    * Add all the properties in this section.
    * @param objectID uid
    */
    @Override
    public final void initComponents(Integer objectID) {
        int row = 0;
        final int leftmargin = 16; //to inner components
        int column = 0; //first column

        //Components of the property: Closed.
        polyline.closed(sectionPanel, row++, column, leftmargin, objectID);

        //Components of the property: Fill Mode.
        contouredObject.fillMode(sectionPanel, row++, column, leftmargin, objectID);

        //Components of the property: Line Mode.
        contouredObject.lineMode(sectionPanel, row++, column, leftmargin, objectID);

        //Components of the property: Visible.
        graphicObject.visible(sectionPanel, row++, column, leftmargin, objectID);
    }
}