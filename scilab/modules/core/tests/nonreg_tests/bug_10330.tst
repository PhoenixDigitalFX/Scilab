// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 10330 -->
//
// <-- CLI SHELL MODE -->
// 
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10330
//
// <-- Short Description -->
// error did not manage vector of strings as input argument
// but lasterror returned vector of strings
//
str = "line 1" + ascii(10) + "line 2";
ref_lasterror = ["line 1"; "line 2"];
assert_checkerror("error(str)", ref_lasterror );

ref_lasterror = ["line 1"; "line 2"];
assert_checkerror("error(ref_lasterror)", ref_lasterror );

errlines = 1:20; errlines = errlines'; errlines = 'error line ' + string(errlines);
assert_checkerror("error(errlines)", errlines);
