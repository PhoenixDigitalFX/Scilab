/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2014 - Scilab Enterprises - Sylvain Genin
 *
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

#include "special_functions_gw.hxx"
#include "function.hxx"
#include "double.hxx"
#include "overload.hxx"

extern "C"
{
#include "Scierror.h"
#include "localization.h"
    extern double C2F(dgammacody)(double*);
}

/*--------------------------------------------------------------------------*/
types::Function::ReturnValue sci_gamma(types::typed_list &in, int _iRetCount, types::typed_list &out)
{
    if (in.size() < 1)
    {
        Scierror(77, _("%s: Wrong number of input arguments: At least %d expected.\n"), "gamma", 1);
        return types::Function::Error;
    }

    if (in.size() > 1 || in[0]->isDouble() == false)
    {
        std::wstring wstFuncName = L"%" + in[0]->getShortTypeStr() + L"_gamma";
        return Overload::call(wstFuncName, in, _iRetCount, out);
    }

    /***** get data *****/
    types::Double* pDblIn = in[0]->getAs<types::Double>();

    if (pDblIn->isComplex() || pDblIn->getDims() > 2)
    {
        return Overload::call(L"%s_gamma", in, _iRetCount, out);
    }

    types::Double* pDblOut = new types::Double(pDblIn->getDims(), pDblIn->getDimsArray());

    double* pDblValIn  = pDblIn->getReal();
    double* pDblValOut = pDblOut->getReal();

    /***** perform operation *****/
    for (int i = 0; i < pDblIn->getSize(); i++)
    {
        pDblValOut[i] = C2F(dgammacody)(pDblValIn + i);
    }

    /***** return data *****/
    out.push_back(pDblOut);
    return types::Function::OK;
}
/*--------------------------------------------------------------------------*/
