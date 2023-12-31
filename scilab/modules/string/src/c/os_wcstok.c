/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) DIGITEO - 2011 - Antoine ELIAS
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

#include "os_wcstok.h"


wchar_t *os_wcstok(wchar_t *_pwstData, const wchar_t *_pwstDelim, wchar_t** _pwstState)
{
#ifndef _MSC_VER
    return wcstok(_pwstData, _pwstDelim, _pwstState);
#else
    return wcstok_s(_pwstData, _pwstDelim, _pwstState);
#endif
}
