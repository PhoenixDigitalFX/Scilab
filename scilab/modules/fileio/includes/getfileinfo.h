/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2007 - INRIA
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
#ifndef __GETFILEINFO_H__
#define __GETFILEINFO_H__

#include <stdio.h>
#include "dynlib_fileio.h"
#include "machine.h"

/**
* get file info in the files table
*/
FILEIO_IMPEXP void C2F(getfileinfo)(int *fd, FILE *fa, int *swap, int *type, int *mode, char *filename, int *lf, int *ierr);

#endif /* __GETFILEINFO_H__ */

