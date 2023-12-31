/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) INRIA - Sylvestre LEDRU
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
#ifndef __GENSUM_H__
#define __GENSUM_H__
#include "machine.h"
#include "dynlib_integer.h"
#include "def.h"

/**
 * TODO : comment
 * @param typ
 * @param n
 * @param dx be carreful using this parameter (crappy way of doing polymorphism)
 * @param incx
 * @return
 */
INTEGER_IMPEXP int C2F(gensum)(int *typ, int *n, void *dx, int *incx);
INTEGER_IMPEXP double C2F(gensumasdouble)(int *typ, int *n, void *dx, int *incx);
#endif /* __GENSUM_H__ */
