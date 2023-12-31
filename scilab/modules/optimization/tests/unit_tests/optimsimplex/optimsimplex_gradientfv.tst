// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2009 - INRIA - Michael Baudin
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

// <-- CLI SHELL MODE -->

function y = rosenbrock (x)
    y = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
endfunction

// Forward
s1 = optimsimplex_new ();
simplex = [
1. -2.0 1.0
4. -1.0 3.0
7. -3.0 2.0
];
s1 = optimsimplex_setall ( s1 , simplex );
computed = optimsimplex_gradientfv ( s1 );
assert_checkalmostequal ( computed , [-3.0 3.0]' , 10 * %eps );
s1 = optimsimplex_destroy ( s1 );
// Centered
s1 = optimsimplex_new ();
simplex = [
1. -2.0 1.0
4. -1.0 3.0
7. -3.0 2.0
];
s1 = optimsimplex_setall ( s1 , simplex );
computed = optimsimplex_gradientfv ( s1 , method = "centered" , fun = rosenbrock );
assert_checkalmostequal ( computed , [-1636.3333333333333 -1684.8333333333333]' , 10 * %eps );
s1 = optimsimplex_destroy ( s1 );
// Centered with additional arguments
myobj = tlist(["T_MYSTUFF","nb"]);
myobj.nb = 0;
function [ y , myobj ] = mycostf ( x , myobj )
    y = rosenbrock(x);
    myobj.nb = myobj.nb + 1
endfunction
s1 = optimsimplex_new ();
simplex = [
1. -2.0 1.0
4. -1.0 3.0
7. -3.0 2.0
];
s1 = optimsimplex_setall ( s1 , simplex );
[ computed , myobj ] = optimsimplex_gradientfv ( s1 , method = "centered" , fun = mycostf , data = myobj );
assert_checkalmostequal ( computed , [-1636.3333333333333 -1684.8333333333333]' , 10 * %eps );
assert_checkequal ( myobj.nb , 2 );
s1 = optimsimplex_destroy ( s1 );

