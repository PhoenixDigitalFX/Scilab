/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
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

extern "C"
{
#include "gw_hdf5.h"
#include "Scierror.h"
#include "api_scilab.h"
#include "localization.h"
}

#include "HDF5Scilab.hxx"

using namespace org_modules_hdf5;

/*
  Create a new attribute (equivalent to h5writeattr).
  Scilab prototype:
  - h5attr(obj, location, name, data)
  - h5attr(obj, location, name, data, targetType)
  - h5attr(filename, location, name, data)
  - h5attr(filename, location, name, data, targetType)
*/

int sci_h5attr(char *fname, int* pvApiCtx)
{
    H5Object * hobj = 0;
    SciErr err;
    int * addr = 0;
    char * str = 0;
    std::string location;
    std::string name;
    std::string file;
    std::string targetType;
    const int nbIn = nbInputArgument(pvApiCtx);

    CheckOutputArgument(pvApiCtx, 0, 1);
    CheckInputArgument(pvApiCtx, 4, 5);

    err = getVarAddressFromPosition(pvApiCtx, 1, &addr);
    if (err.iErr)
    {
        printError(&err, 0);
        Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, 1);
        return 0;
    }

    if (HDF5Scilab::isH5Object(addr, pvApiCtx))
    {
        hobj = HDF5Scilab::getH5Object(addr, pvApiCtx);
        if (!hobj)
        {
            Scierror(999, _("%s: Invalid H5Object.\n"), fname);
            return 0;
        }
    }
    else
    {
        if (!isStringType(pvApiCtx, addr) || !checkVarDimension(pvApiCtx, addr, 1, 1))
        {
            Scierror(999, gettext("%s: Wrong type for input argument #%d: string or H5Object expected.\n"), fname, 1);
            return 0;
        }

        if (getAllocatedSingleString(pvApiCtx, addr, &str) != 0)
        {
            Scierror(999, _("%s: No more memory.\n"), fname);
            return 0;
        }

        file = std::string(str);
        freeAllocatedSingleString(str);
    }

    err = getVarAddressFromPosition(pvApiCtx, 2, &addr);
    if (err.iErr)
    {
        printError(&err, 0);
        Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, 2);
        return 0;
    }

    if (!isStringType(pvApiCtx, addr) || !checkVarDimension(pvApiCtx, addr, 1, 1))
    {
        Scierror(999, gettext("%s: Wrong type for input argument #%d: string expected.\n"), fname, 2);
        return 0;
    }

    if (getAllocatedSingleString(pvApiCtx, addr, &str) != 0)
    {
        Scierror(999, _("%s: No more memory.\n"), fname);
        return 0;
    }

    location = std::string(str);
    freeAllocatedSingleString(str);

    err = getVarAddressFromPosition(pvApiCtx, 3, &addr);
    if (err.iErr)
    {
        printError(&err, 0);
        Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, 3);
        return 0;
    }

    if (!isStringType(pvApiCtx, addr) || !checkVarDimension(pvApiCtx, addr, 1, 1))
    {
        Scierror(999, gettext("%s: Wrong type for input argument #%d: string expected.\n"), fname, 3);
        return 0;
    }

    if (getAllocatedSingleString(pvApiCtx, addr, &str) != 0)
    {
        Scierror(999, _("%s: No more memory.\n"), fname);
        return 0;
    }

    name = std::string(str);
    freeAllocatedSingleString(str);

    if (nbIn == 5)
    {
        err = getVarAddressFromPosition(pvApiCtx, nbIn, &addr);
        if (err.iErr)
        {
            printError(&err, 0);
            Scierror(999, _("%s: Can not read input argument #%d.\n"), fname, nbIn);
            return 0;
        }

        if (!isStringType(pvApiCtx, addr) || !checkVarDimension(pvApiCtx, addr, 1, 1))
        {
            Scierror(999, _("%s: Wrong size for input argument #%d: string expected.\n"), fname, nbIn);
            return 0;
        }

        if (getAllocatedSingleString(pvApiCtx, addr, &str) != 0)
        {
            Scierror(999, _("%s: No more memory.\n"), fname);
            return 0;
        }

        targetType = std::string(str);
        freeAllocatedSingleString(str);
    }

    try
    {
        if (hobj)
        {
            HDF5Scilab::createObjectFromStack<H5Attribute>(*hobj, location, name, true, pvApiCtx, 4, 0, 0, 0, 0, 0, 0, targetType, 0, 0, 0, 0, 0, 0, 0);
        }
        else
        {
            HDF5Scilab::createObjectFromStack<H5Attribute>(file, location, name, true, pvApiCtx, 4, 0, 0, 0, 0, 0, 0, targetType, 0, 0, 0, 0, 0, 0, 0);
        }
    }
    catch (const H5Exception & e)
    {
        Scierror(999, _("%s: %s\n"), fname, e.what());
        return 0;
    }

    AssignOutputVariable(pvApiCtx, 1) = 0;
    ReturnArguments(pvApiCtx);

    return 0;
}
