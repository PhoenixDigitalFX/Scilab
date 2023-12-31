// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) 2017 - Samuel GOUGEON
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function v = intsplin(x, s)
    //splin  numerical integration.
    //v = intsplin(x,s) computes the integral of y with respect to x using
    //splin interpolation and integration.
    //x and y must be vectors of the same dimension
    //
    //v = intsplin(s) computes the integral of y assuming unit
    //spacing between the data points.

    x = x(:);
    if argn(2) < 2 then
        s = x;
        x = (1:size(s,"*"))';
    else
        s = s(:);
        if size(x,"*")<>size(s,"*") then
            msg = _("%s: Wrong size for input arguments: Same size expected.\n")
            error(msprintf(msg, "intsplin"));
        end
    end
    if ~isreal(x) then
        if isreal(x,%eps)
            x = real(x);
        else
            msg = _("%s: Argument #%d: Real number(s) expected.\n");
            error(msprintf(msg, "intsplin",1))
        end
    end
    h = x(2:$) - x(1:$-1);
    y = real(s);
    d = splin(x, y);
    v = sum((h.*(d(1:$-1)-d(2:$))/12 + (y(1:$-1)+y(2:$))/2).*h);
    if ~isreal(s) then
        y = imag(s);
        d = splin(x, y);
        v = v + %i*sum((h.*(d(1:$-1)-d(2:$))/12 + (y(1:$-1)+y(2:$))/2).*h);
    end
endfunction
