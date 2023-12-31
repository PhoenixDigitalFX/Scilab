/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2007 - INRIA - Allan CORNET
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

#ifndef __WITH_FFTW_H__
#define __WITH_FFTW_H__

#include "machine.h" /* C2F */
#include "BOOL.h"
#include "dynlib_fftw.h"

/**
* check if it is with FFTW
* @param rep 1 (WITH) or 0 (WITHOUT)
* @return 0
*/
FTTW_SCILAB_IMPEXP int C2F(withfftw)(int *rep);

/**
* check if it is with FFTW
* @return TRUE or FALSE
*/
FTTW_SCILAB_IMPEXP BOOL withfftw(void);

#endif /* __WITH_FFTW_H__ */
/*--------------------------------------------------------------------------*/
