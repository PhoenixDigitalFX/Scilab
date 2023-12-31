/*
* Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
* Copyright (C) 2012 - DIGITEO - Allan CORNET
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
/*-----------------------------------------------------------------------------------*/
#include "machine.h"
#include "BOOL.h"
/*-----------------------------------------------------------------------------------*/
/* This is only by f2c windows visual studio solution */
/*-----------------------------------------------------------------------------------*/
int C2F(withf2c)(int *bOK);
/*-----------------------------------------------------------------------------------*/
int C2F(withf2c)(int *bOK)
{
    *bOK = TRUE;
    return TRUE;
}
/*-----------------------------------------------------------------------------------*/
