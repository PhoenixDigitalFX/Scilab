// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 14775 -->
//
// <-- CLI SHELL MODE -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14775
//
// <-- Short Description -->
//
// load empty (0 bytes) .sod File crashes scilab


f = TMPDIR + filesep() + "empty.sod";
mputl("",f);
refMsg = msprintf(_("%s: %s is not a valid lib file.\n"), "load", f);
assert_checkerror("load(f)", refMsg);
