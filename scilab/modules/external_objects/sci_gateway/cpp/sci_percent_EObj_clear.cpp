/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2018 - ESI Group - Clement DAVID
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */

#include "ScilabGateway.hxx"

extern "C" {
#include "Scierror.h"
#include "gw_external_objects.h"
}

using namespace org_modules_external_objects;

int sci_percent_EObj_clear(char * fname, void* pvApiCtx)
{
    try
    {
        return ScilabGateway::clear(fname, 0, pvApiCtx);
    }
    catch (std::exception & e)
    {
        Scierror(999, _("%s: An error occurred: %s"), fname, e.what());
        return 0;
    }
}
