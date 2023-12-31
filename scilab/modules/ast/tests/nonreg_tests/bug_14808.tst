// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 14808 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14808
//
// <-- Short Description -->
// E=[ 'A' 'B' 'C' 'D' 'E']  ,  E(0:0) Crash Scilab Console

refMsg = msprintf(_("Invalid index.\n"));
assert_checkerror("E=[ ""A"" ""B"" ""C"" ""D"" ""E""];E(0:0)", refMsg);
