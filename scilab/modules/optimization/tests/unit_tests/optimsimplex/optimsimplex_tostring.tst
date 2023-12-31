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


// Test with 3 vertices
s1 = optimsimplex_new ();
simplex = [
24. -2.0 1.0
93. -1.0 3.0
36. -3.0 2.0
];
s1 = optimsimplex_setall ( s1 , simplex );
str = string ( s1 );
expected = [
"Optim Simplex Object:"
"====================="
"nbve: 3"
"n: 2"
"x: 3-by-2 matrix"
"fv: 3-by-1 matrix"
];
assert_checkequal ( str , expected );
s1 = optimsimplex_destroy ( s1 );

// Test with 4 vertices
s1 = optimsimplex_new ();
simplex = [
24. -2.0 1.0
93. -1.0 3.0
36. -3.0 2.0
36. -3.0 2.0
];
s1 = optimsimplex_setall ( s1 , simplex );
str = string ( s1 );
expected = [
"Optim Simplex Object:"
"====================="
"nbve: 4"
"n: 2"
"x: 4-by-2 matrix"
"fv: 4-by-1 matrix"
];
assert_checkequal ( str , expected );
s1 = optimsimplex_destroy ( s1 );

