// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->


c = round([1.3 1.5 1.7 2.5 3.7]);
e = [1 2 2 3 4];
assert_checkequal(c,e);
// Notice the result for x negative
c = round([-1.3 -1.5 -1.7 -2.5 -3.7]);
e = [-1 -2 -2 -3 -4];
assert_checkequal(c,e);

assert_checkequal([ 2+%i*23,%i*3,-%i] ,round([2.2+%i*23, %pi*%i, -%i ]));
