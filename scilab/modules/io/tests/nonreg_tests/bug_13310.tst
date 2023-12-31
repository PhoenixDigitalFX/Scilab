// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 13310 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13310
//
// <-- Short Description -->
// .scg files createad by Scilab 5.4.1 can no more be loaded (pixmap property removed).

load(fullfile(SCI, "modules", "io", "tests", "nonreg_tests", "bug_13310.scg"));