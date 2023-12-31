/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2007-2008 - INRIA - Vincent COUVERT
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

#ifndef __GETCHARWITHOUTOUTPUT_H__
#define __GETCHARWITHOUTOUTPUT_H__
/*--------------------------------------------------------------------------*/
#include "dynlib_console.h"
/*--------------------------------------------------------------------------*/
/**
* Make the console wait for a user input character (used for [more (y or n) ?])
* @return code for the character entered
*/
CONSOLE_IMPEXP int GetCharWithoutOutput(void);
/*--------------------------------------------------------------------------*/
#endif /* __GETCHARWITHOUTOUTPUT_H__ */

