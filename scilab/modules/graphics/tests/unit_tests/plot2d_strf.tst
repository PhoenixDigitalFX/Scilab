// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

refMsg = msprintf(_("%s: Wrong value for strf option: %s.\n"), "plot2d", "aze");
assert_checkerror("plot2d(1,1,1,''aze'')", refMsg, 999);
