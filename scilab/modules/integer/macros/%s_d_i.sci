// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA -
// Copyright (C) 2013 - Samuel GOUGEON : https://gitlab.com/scilab/scilab/-/issues/13000
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

// used to manage eye() ./ int
function r = %s_d_i(a,b)
    if a==[] then
        r = []
    else
        r = iconvert(a,inttype(b))./b
    end
endfunction