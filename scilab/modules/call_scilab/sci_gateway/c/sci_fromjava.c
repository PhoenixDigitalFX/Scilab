/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2006 - INRIA - Allan CORNET
 * Copyright (C) 2013 - Scilab Enterprises - Cedric Delamarre
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
#include "gw_core.h"
#include "api_scilab.h"
#include "sci_malloc.h"
#include "fromjava.h"
#include "localization.h"
#include "Scierror.h"
#include "gw_call_scilab.h"

/*--------------------------------------------------------------------------*/
int sci_fromjava(char *fname, void* pvApiCtx)
{
    CheckInputArgument(pvApiCtx, 0, 0);
    CheckOutputArgument(pvApiCtx, 0, 1);

    if ( IsFromJava() )
    {
        if (createScalarBoolean(pvApiCtx, 1, TRUE))
        {
            Scierror(999, _("%s: Memory allocation error.\n"), fname);
            return 1;
        }
    }
    else
    {
        if (createScalarBoolean(pvApiCtx, 1, FALSE))
        {
            Scierror(999, _("%s: Memory allocation error.\n"), fname);
            return 1;
        }
    }

    AssignOutputVariable(pvApiCtx, 1) = 1;
    ReturnArguments(pvApiCtx);
    return 0;
}
/*--------------------------------------------------------------------------*/
