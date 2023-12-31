/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2011 - DIGITEO - Antoine ELIAS
 * Copyright (C) 2014 - Scilab Enterprises - Anais Aubert
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
/*--------------------------------------------------------------------------*/
#include "elem_func_gw.hxx"
#include "function.hxx"
#include "overload.hxx"
#include "double.hxx"
#include "string.hxx"

extern "C"
{
#include "Scierror.h"
#include "localization.h"
#include "basic_functions.h"
}

const wchar_t g_pwstConfigInfo[] = L"info";
const wchar_t g_pwstConfigSeed[] = L"seed";

const wchar_t g_pwstTypeUniform[] = L"uniform";
const wchar_t g_pwstTypeNormal[] = L"normal";

int setRandType(const wchar_t* _wcType);
double getNextRandValue(int _iRandType, int* _piRandSave, int _iForceInit);

/*
clear a;nb = 2500;a = rand(nb, nb);tic();rand(a);toc
clear a;nb = 2500;a = rand(nb, nb);a = a + a * %i;tic();rand(a);toc
*/

types::Function::ReturnValue sci_rand(types::typed_list &in, int _iRetCount, types::typed_list &out)
{
    types::Double* pOut = NULL;
    static int siRandType = 0;
    static int siRandSave = 0;
    static int iForceInit	= 0;

    int iSizeIn = (int)in.size();
    if (iSizeIn == 0 || iSizeIn == -1)
    {
        //rand or rand()
        double dblRand = getNextRandValue(siRandType, &siRandSave, 0);
        out.push_back(new types::Double(dblRand));
        return types::Function::OK;
    }

    if (in[0]->isString())
    {
        //rand("xxx")
        types::String* pS = in[0]->getAs<types::String>();
        if (pS->getSize() != 1)
        {
            Scierror(999, _("%s: Wrong size for input argument #%d: string expected.\n"), "rand", 1);
            return types::Function::Error;
        }

        wchar_t* pwstKey = pS->get(0);

        if (!wcscmp(pwstKey,g_pwstConfigInfo))
        {
            //info
            if (iSizeIn > 1)
            {
                Scierror(77, _("%s: Wrong number of input argument(s): %d expected.\n"), "rand", 1);
                return types::Function::Error;
            }

            if (siRandType == 0)
            {
                out.push_back(new types::String(g_pwstTypeUniform));
            }
            else
            {
                out.push_back(new types::String(g_pwstTypeNormal));
            }
        }
        else if (!wcscmp(pwstKey,g_pwstConfigSeed))
        {
            //seed
            if (iSizeIn == 1)
            {
                //get
                out.push_back(new types::Double(siRandSave));
            }
            else if (iSizeIn == 2)
            {
                if (in[1]->isDouble() == false || in[1]->getAs<types::Double>()->isScalar() == false)
                {
                    Scierror(999, _("%s: Wrong size for input argument #%d: A scalar expected.\n"), "rand", 2);
                    return types::Function::Error;
                }

                siRandSave = (int)std::max(in[1]->getAs<types::Double>()->get(0), double(0));
                iForceInit = 1;
            }
            else
            {
                Scierror(77, _("%s: Wrong number of input argument(s): %d expected.\n"), "rand", 2);
                return types::Function::Error;
            }
        }
        else
        {
            int iRandSave = siRandType;
            if (iSizeIn > 1)
            {
                Scierror(77, _("%s: Wrong number of input argument(s): %d expected.\n"), "rand", 1);
                return types::Function::Error;
            }
            siRandType = setRandType(pwstKey);
            if (siRandType < 0) 
            {
                siRandType = iRandSave;                
                Scierror(999, _("%s: Wrong value for input argument #%d: '%s', '%s', '%s' or '%s' expected.\n"), "rand", 1,"info","seed","uniform","normal");
                return types::Function::Error;
            }
        }
    }
    else
    {
        int iRandSave = siRandType;
        if (in[iSizeIn - 1]->isString())
        {
            //uniform ou normal
            types::String* pS = in[iSizeIn - 1]->getAs<types::String>();
            if (pS->getSize() != 1)
            {
                Scierror(999, _("%s: Wrong size for input argument #%d: string expected.\n"), "rand", iSizeIn);
                return types::Function::Error;
            }

            //set randomize law
            siRandType = setRandType(pS->get(0));
            if (siRandType < 0) 
            {
                siRandType = iRandSave;                
                Scierror(999, _("%s: Wrong value for input argument #%d: '%s' or '%s' expected.\n"), "rand", iSizeIn,"uniform","normal");
                return types::Function::Error;
            }
            
            iSizeIn--;
        }

        types::typed_list args;
        std::copy(in.begin(), in.begin() + iSizeIn, back_inserter(args));

        int iDims = 0;
        int* piDims = NULL;
        bool alloc = false;

        bool ret = getDimsFromArguments(args, "rand", &iDims, &piDims, &alloc);
        if (ret == false)
        {
            switch (iDims)
            {
                case -1:
                    Scierror(21, _("Invalid index.\n"));
                    break;
                case 1:
                {
                    //call overload
                    return Overload::generateNameAndCall(L"rand", in, _iRetCount, out);
                }
            }

            return types::Function::Error;
        }

        //special case for complex unique complex argument
        bool complex = false;
        if (in.size() == 1 && in[0]->isGenericType())
        {
            complex = in[0]->getAs<types::GenericType>()->isComplex();
        }

        pOut = new types::Double(iDims, piDims, complex);
        if (alloc)
        {
            delete[] piDims;
        }

        double* pd = pOut->get();
        for (int i = 0; i < pOut->getSize(); i++)
        {
            pd[i] = getNextRandValue(siRandType, &siRandSave, iForceInit);
            iForceInit = 0;
        }

        if (pOut->isComplex())
        {
            double* pImg = pOut->getImg();
            for (int i = 0; i < pOut->getSize(); i++)
            {
                pImg[i] = getNextRandValue(siRandType, &siRandSave, iForceInit);
            }
        }
        out.push_back(pOut);
        //retore previous law
        siRandType = iRandSave;
    }

    return types::Function::OK;
}
/*--------------------------------------------------------------------------*/
double getNextRandValue(int _iRandType, int* _piRandSave, int _iForceInit)
{
    static int siInit = TRUE;
    static double sdblImg = 0;
    static double sdblR = 0;
    double dblReal = 0;
    double dblVal = 0;
    double dblTemp = 2;

    if (_iForceInit)
    {
        siInit = TRUE;
    }

    if (_iRandType == 0)
    {
        dblVal = durands(_piRandSave);
    }
    else
    {
        if (siInit == TRUE)
        {
            while (dblTemp > 1)
            {
                dblReal = 2 * durands(_piRandSave) - 1;
                sdblImg = 2 * durands(_piRandSave) - 1;
                dblTemp = dblReal * dblReal + sdblImg * sdblImg;
            }
            sdblR = dsqrts(-2 * dlogs(dblTemp) / dblTemp);
            dblVal = dblReal * sdblR;
        }
        else
        {
            dblVal = sdblImg * sdblR;
        }
        siInit = !siInit;
    }
    return dblVal;
}

int setRandType(const wchar_t* _wcType)
{
    if (!wcscmp(_wcType,g_pwstTypeUniform))
    {
        return 0;
    }
    if (!wcscmp(_wcType,g_pwstTypeNormal))
    {
        return 1;
    }

    // shortcut version
    if (_wcType[0] == g_pwstTypeUniform[0] && _wcType[1] == L'\0')
    {
        return 0;
    }
    if (_wcType[0] == g_pwstTypeNormal[0] && _wcType[1] == L'\0')
    {
        return 1;
    }

    // invalid key
    return -1;
}
/*--------------------------------------------------------------------------*/

