/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2008 - INRIA
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

#ifndef __VECT_OR_H__
#define __VECT_OR_H__

#include "dynlib_boolean.h"

#define OR_ON_ALL 0
#define OR_BY_ROWS 1
#define OR_BY_COLUMNS 2

/**
 * logical "or" of the elements of an array
 *
 * @param[in] v boolean matrix as input
 * @param[in] m rows size
 * @param[in] n columns size
 * @param[out] r result of logical "or"
 * @param[in] opt: OR_ON_ALL, OR_BY_ROWS or OR_BY_COLUMNS
 */
BOOLEAN_IMPEXP void vect_or(const int *v, int m, int n, int *r, int opt);

#endif /* __VECT_OR_H__ */
