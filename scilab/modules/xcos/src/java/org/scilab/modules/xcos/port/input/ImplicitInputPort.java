/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2009 - DIGITEO - Bruno JOFRET
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

package org.scilab.modules.xcos.port.input;

import org.scilab.modules.xcos.JavaController;
import org.scilab.modules.xcos.Kind;

/**
 * An implicit output port is a port where the output characteristic does not
 * imply the transfer of information in an a priori known direction (Output and
 * Input are equivalent).
 *
 * This kind of port are used primarily used on Modelica blocks. In fact the
 * modelica description language has an equality symbol with mathematical
 * meaning.
 */
public class ImplicitInputPort extends InputPort {

    private static final long serialVersionUID = 8711291857895989304L;

    /** Default constructor */
    public ImplicitInputPort(JavaController controller, long uid, Kind kind, Object value, String style, String id) {
        super(controller, uid, kind, value, style == null || style.isEmpty() ? "ImplicitInputPort" : style, id, true);
    }

    /** @return always Type.IMPLICIT */
    @Override
    public Type getType() {
        return Type.IMPLICIT;
    }

}
