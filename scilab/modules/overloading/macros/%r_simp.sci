// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) Samuel GOUGEON - 2015-2016 - sgougeon@free.fr : Bug 13893
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function h = %r_simp(h, d)
    // implement complex case
    // 0/den => 0/1
    if argn(2)==1 then
        n = h.num
        d = h.den
    else
        n = h
        h = []
    end
    [n, d] = simp(n, d);
    i = find(n==0 & d~=0)
    d(i) = 1
    h = rlist(n, d, h(4))
endfunction
