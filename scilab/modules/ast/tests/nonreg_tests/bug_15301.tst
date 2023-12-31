// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2017 - ESI - Delamarre Cedric
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 15301 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/15301
//
// <-- Short Description -->
// Sequence constructor ':' failed when a bound was an outputless funtion call

errmsg = sprintf(_("%ls: Wrong type for argument %d: Real scalar expected.\n"), "'':''",2);
assert_checkerror("1:disp(""ok"")", errmsg);
