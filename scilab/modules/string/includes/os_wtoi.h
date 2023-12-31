/*
 *  Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 *  Copyright (C) 2014 - Scilab Enterprises - Cedric Delamarre
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

#ifndef __OS_WTOI_H__
#define __OS_WTOI_H__

#include <string.h>
#include "dynlib_string.h"

STRING_IMPEXP int os_wtoi(const wchar_t* pwcsStr, std::size_t* pos);

#endif /* !__OS_WTOI_H__ */
