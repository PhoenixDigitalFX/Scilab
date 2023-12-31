// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) 2012 - 2016 - Scilab Enterprises
// Copyright (C) 2019 - Samuel GOUGEON
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function t = coth(x)
    //Syntax : t=coth(x)
    //
    // hyperbolic co-tangent of x

    if argn(2) <> 1 then
        error(msprintf(gettext("%s: Wrong number of input argument(s): %d expected.\n"),"coth",1));
    end

    if and(type(x) <> [1 5]) then
        error(msprintf(gettext("%s: Wrong type for input argument #%d: Real or complex matrix expected.\n"),"coth",1));
    end
    // ( coth(0) => +/- Inf ) => (sparse => full)
    t = 1 ./ tanh(full(x))
endfunction
