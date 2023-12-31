/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
 * Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
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

extern "C" {
#include "Scierror.h"
#include "gw_external_objects_java.h"
}

#include "ScilabJavaEnvironment.hxx"
#include "ScilabGateway.hxx"

using namespace org_scilab_modules_external_objects_java;
using namespace org_modules_external_objects;

int sci_jallowClassReloading(char * fname, void* pvApiCtx)
{
    try
    {
        const int envId = ScilabJavaEnvironment::start();

        ScilabJavaEnvironment *javaEnvironment = ScilabJavaEnvironment::getInstance();
        if (!javaEnvironment)
        {
            Scierror(999, "%s: No Java environment available (instance is null).", fname);
            return 0;
        }

        JavaOptionsSetter setter = javaEnvironment->getOptionsHelper().getSetter(JavaOptionsSetter::ALLOWRELOAD);
        return ScilabGateway::getsetOptions(fname, envId, setter, pvApiCtx);
    }
    catch (std::exception & e)
    {
        Scierror(999, "%s: An error occurred: %s", fname, e.what());
        return 0;
    }

    return 0;
}
