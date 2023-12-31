/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2010 - DIGITEO - Bruno JOFRET
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
package org.scilab.modules.ui_data.variablebrowser;

/**
 * Variable browser Interface
 * Describes actions exposed to scilab.
 *
 */
public interface VariableBrowser {

    /**
     * Close Variable Browser.
     */
    void close();

    /**
     * Set Data stored in JTable.
     * @param data : the data to be displayed.
     */
    void setData(Object[][] data);

    /**
     * Update row filtering
     */
    void updateRowFiltering();

}
