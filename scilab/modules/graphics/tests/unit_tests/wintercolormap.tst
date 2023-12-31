// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

assert_checkerror("wintercolormap(0,1,2,3)", "%s: Wrong number of input argument(s): %d expected.\n", 10000, "wintercolormap", 1);

assert_checkerror("wintercolormap(%t)", "%s: Wrong type for input argument #%d: a real scalar expected.\n", 10000, "wintercolormap", 1);

assert_checkerror("wintercolormap(%i)", "%s: Wrong type for input argument #%d: a real scalar expected.\n", 10000, "wintercolormap", 1);

assert_checkerror("wintercolormap([0 1 2 3])", "%s: Wrong size for input argument #%d: a real scalar expected.\n", 10000, "wintercolormap", 1);

assert_checkequal(wintercolormap(0), []);

assert_checkequal(wintercolormap(1), [0 0 1]);

assert_checkequal(wintercolormap(2), [0 0 1;0 1 0.5]);

assert_checkequal(wintercolormap(3), [0 0 1;0 0.5 0.75;0 1 0.5]);
