/*
*  Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
*  Copyright (C) 2008-2008 - DIGITEO - Antoine ELIAS
*  Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
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

#include "int.hxx"

namespace types
{
#ifdef _MSC_VER
template class ArrayOf<char>;
template class ArrayOf<unsigned char>;
template class ArrayOf<short>;
template class ArrayOf<unsigned short>;
template class ArrayOf<unsigned int>;
template class ArrayOf<unsigned long long>;
#endif
}
