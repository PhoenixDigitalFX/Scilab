/*
* Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
* Copyright (C) 2010 - DIGITEO - Allan CORNET
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

#ifndef __VFLOOR_H__
#define __VFLOOR_H__

#include "machine.h"
#include "dynlib_elementary_functions.h"

ELEMENTARY_FUNCTIONS_IMPEXP void C2F(vfloor)(int *n, double *x, int *ix, double *y, int *iy);

#endif /* __VFLOOR_H__ */

