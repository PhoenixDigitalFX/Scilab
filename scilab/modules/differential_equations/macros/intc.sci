// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA - Farid BELAHCENE
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier: added argument checking and error control
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function [r, err] = intc(a, b, f, abserr, relerr)
    // If f is a complex-valued macro, intc(a, b, f) computes
    // the integral from a to b of f(z)dz along the straight
    // line a-b of the complex plane.
    // abserr: absolute error required. Default: 1d-13.
    // relerr: relative error required. Default: 1d-8.
    // err : estimated absolute error on the result.

    [lhs, rhs] = argn();

    // CHECKING ARGUMENTS
    // ------------------
    if rhs < 3 then
        error(msprintf(_("%s: Wrong number of input argument(s): at least %d expected.\n"), "intc", 3));
    end
    // relerr
    if ~isdef("relerr","l") | relerr==[] then
        relerr = 1d-8
    end
    if type(relerr) <> 1 then
        msg = _("%s: Wrong type for input argument #%d: Real expected.\n")
        error(msprintf(msg, "intc", 5));
    end
    if ~isscalar(relerr) then
        msg = _("%s: Argument #%d: Scalar (1 element) expected.\n")
        error(msprintf(msg, "intc", 5));
    end
    // abserr
    if ~isdef("abserr","l") then
        abserr = 1d-13
    end
    if type(abserr) <> 1 then
        msg = _("%s: Wrong type for input argument #%d: Real expected.\n")
        error(msprintf(msg, "intc", 4));
    end
    if ~isscalar(abserr) then
        msg = _("%s: Argument #%d: Scalar (1 element) expected.\n")
        error(msprintf(msg, "intc", 4));
    end
    // f
    if and(type(f) <> [13 130]) then
        error(msprintf(_("%s: Wrong type for input argument #%d: Scilab function expected.\n"), "intc", 3));
    end

    // PROCESSING
    // ----------
    // Define two functions which define the real part and
    // imaginary part of f(g(t))*g'(t) where g(t) is a
    // parametrization of the line a-b.
    deff("r = real1(t, a, b, f)", "r = real(f((1-t)*a+t*b)*(b-a));")
    deff("r = imag1(t, a, b, f)", "r = imag(f((1-t)*a+t*b)*(b-a));")
    [r1, err1] = intg(0, 1, list(real1, a, b, f), abserr, relerr);
    [r2, err2] = intg(0, 1, list(imag1, a, b, f), abserr, relerr);
    r = r1 + %i*r2;
    err = err1 + %i*err2;

endfunction
