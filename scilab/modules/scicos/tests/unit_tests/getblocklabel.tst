// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->

refMsg = msprintf(_("%s: scicosim is not running.\n"), "getblocklabel");
assert_checkerror("getblocklabel()", refMsg);

refMsg = msprintf(_("%s: scicosim is not running.\n"), "getblocklabel");
assert_checkerror("getblocklabel(1)", refMsg);
