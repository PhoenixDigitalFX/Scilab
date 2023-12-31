/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2017 - Scilab Enterprises - Paul Bignier
 *
 * Copyright (C) 2012 - 2017 - Scilab Enterprises
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */

#include "io_gw.hxx"
#include "types.hxx"
#include "double.hxx"
#include "function.hxx"

extern "C"
{
#include "getpidc.h"
#include "localization.h"
#include "Scierror.h"
}

types::Function::ReturnValue sci_getpid(types::typed_list &in, int /*_iRetCount*/, types::typed_list &out)
{
    if (in.size() != 0)
    {
        Scierror(77, _("%s: Wrong number of input argument(s): %d expected.\n"), "getpid", 0);
        return types::Function::Error;
    }

    int pid = 0;
    getpidc(&pid);

    out.push_back(new types::Double(pid));
    return types::Function::OK;
}
