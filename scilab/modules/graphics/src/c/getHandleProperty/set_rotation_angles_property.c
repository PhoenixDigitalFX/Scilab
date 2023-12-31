/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2004-2006 - INRIA - Fabrice Leray
 * Copyright (C) 2006 - INRIA - Allan Cornet
 * Copyright (C) 2006 - INRIA - Jean-Baptiste Silvy
 * Copyright (C) 2010 - DIGITEO - Manuel Juliachs
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

/*------------------------------------------------------------------------*/
/* file: set_rotation_angles_property.c                                   */
/* desc : function to modify in Scilab the rotation_angles field of       */
/*        a handle                                                        */
/*------------------------------------------------------------------------*/

#include "setHandleProperty.h"
#include "SetProperty.h"
#include "getPropertyAssignedValue.h"
#include "SetPropertyStatus.h"
#include "Scierror.h"
#include "localization.h"

#include "setGraphicObjectProperty.h"
#include "graphicObjectProperties.h"

/*------------------------------------------------------------------------*/
int set_rotation_angles_property(void* _pvCtx, int iObjUID, void* _pvData, int valueType, int nbRow, int nbCol)
{
    BOOL status = FALSE;
    double* values = (double*)_pvData;

    if (valueType != sci_matrix)
    {
        Scierror(999, _("Wrong type for '%s' property: Real matrix expected.\n"), "rotation_angles");
        return SET_PROPERTY_ERROR;
    }

    if (nbRow != 1 || nbCol != 2)
    {
        Scierror(999, _("Wrong size for '%s' property: Row vector of size %d expected.\n"), "rotation_angles", 2);
        return SET_PROPERTY_ERROR;
    }

    status = setGraphicObjectProperty(iObjUID, __GO_ROTATION_ANGLES__, values, jni_double_vector, 2);

    if (status == TRUE)
    {
        return SET_PROPERTY_SUCCEED;
    }
    else
    {
        Scierror(999, _("'%s' property does not exist for this handle.\n"), "rotation_angles");
        return SET_PROPERTY_ERROR;
    }
}
/*------------------------------------------------------------------------*/
