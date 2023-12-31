// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
assert_checkequal( [1,1,1,2,3] ,fix([1.3 1.5 1.7 2.5 3.7]));
// Notice the result for x negative
assert_checkequal( [-1,-1,-1,-2,-3],fix([-1.3 -1.5 -1.7 -2.5 -3.7]));
assert_checkequal([ 2+%i*23,%i*3,-%i] ,fix([2.2+%i*23, %pi*%i, -%i ]));

