/*
*  Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
*  Copyright (C) 2008-2008 - DIGITEO - Antoine ELIAS
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

#ifndef __TAN_H__
#define __TAN_H__

#include "dynlib_elementary_functions.h"

ELEMENTARY_FUNCTIONS_IMPEXP double dtans(double _dblVal);
ELEMENTARY_FUNCTIONS_IMPEXP void ztans(double _dblRealIn, double _dblImgIn, double* _dblRealOut, double* _dblImgOut);

ELEMENTARY_FUNCTIONS_IMPEXP double datans(double _dblVal);
ELEMENTARY_FUNCTIONS_IMPEXP double datan2s(double _dblValX, double _dblValY);
ELEMENTARY_FUNCTIONS_IMPEXP void watan(double _dblReal, double _dblImg, double *_pdblReal, double *_pdblImg);

#endif /* __TAN_H__ */