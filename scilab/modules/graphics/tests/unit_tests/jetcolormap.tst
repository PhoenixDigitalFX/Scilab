// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH Ga rAPHIC -->

assert_checkerror("jetcolormap(0,1,2,3)", "%s: Wrong number of input argument(s): %d expected.\n", 10000, "jetcolormap", 1);

assert_checkerror("jetcolormap(%t)", "%s: Wrong type for input argument #%d: a real scalar expected.\n", 10000, "jetcolormap", 1);

assert_checkerror("jetcolormap(%i)", "%s: Wrong type for input argument #%d: a real scalar expected.\n", 10000, "jetcolormap", 1);

assert_checkerror("jetcolormap([0 1 2 3])", "%s: Wrong size for input argument #%d: a real scalar expected.\n", 10000, "jetcolormap", 1);

assert_checkequal(jetcolormap(0), []);

assert_checkequal(jetcolormap(1), [0.5 1 0.5]);

assert_checkequal(jetcolormap(2), [0 0.5 1;1 0.5 0]);

assert_checkalmostequal(jetcolormap(3), [0 1/6 1;0.5 1 0.5;1 1/6 0]);
