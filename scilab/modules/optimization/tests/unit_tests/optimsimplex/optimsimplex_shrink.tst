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

//
// Test optimsimplex_shrink
//
//
// Test with 3 vertices
//
s1 = optimsimplex_new ();
s1 = optimsimplex_setn(s1,2);
s1 = optimsimplex_setnbve(s1,3);
newsimplex = [
    0.    0.  
    1.    0.  
    0.    1.  
];
s1 = optimsimplex_setallx ( s1 , newsimplex );
s1 = optimsimplex_setallfv ( s1 , [-12.0 0.0 0.0]' );
s1 = optimsimplex_shrink ( s1 , rosenbrock );
computed = optimsimplex_getall ( s1 );
// The function value at vertex #1 is not re-computed, as expected.
expected = [
  -12.    0.     0.   
    6.5    0.5    0.   
    26.    0.     0.5  
];
assert_checkequal ( computed , expected );
s1 = optimsimplex_destroy ( s1 );
//
// Test with an additional argument
//
myobj = tlist(["T_MYSTUFF","nb"]);
myobj.nb = 0;
function [ y , myobj ] = mycostf ( x , myobj )
  y = rosenbrock(x);
  myobj.nb = myobj.nb + 1
endfunction
s1 = optimsimplex_new ();
newsimplex = [
-12.0 0.0 0.0
6.0 1.0 0.0
7.0 0.0 1.0
];
s1 = optimsimplex_setall ( s1 , newsimplex );
[ s1 , myobj ] = optimsimplex_shrink ( s1 , mycostf , data=myobj );
computed = optimsimplex_getall ( s1 );
// The function value at vertex #1 is not re-computed, as expected.
expected = [
   -12.    0.     0.   
    6.5    0.5    0.   
    26.    0.     0.5  
];
assert_checkequal ( computed , expected );
assert_checkequal ( myobj.nb , 2 );
s1 = optimsimplex_destroy ( s1 );


//
// Test with 5 vertices
//
s1 = optimsimplex_new ();
newsimplex = [
12.0 0.0 0.0
12.0 1.0 0.0
12.0 0.0 1.0
12.0 1.0 1.0
12.0 2.0 2.0
];
s1 = optimsimplex_setall ( s1 , newsimplex );
s1 = optimsimplex_shrink ( s1 , rosenbrock );
computed = optimsimplex_getall ( s1 );
// The function value at vertex #1 is not re-computed, as expected.
expected = [
    12.    0.     0.   
    6.5    0.5    0.   
    26.    0.     0.5  
    6.5    0.5    0.5  
    0.     1.     1.   
];
assert_checkequal ( computed , expected );
s1 = optimsimplex_destroy ( s1 );

