// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 11035 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11035
//
// <-- Short Description -->
// Scilab crashes when loading a mat file created with Matlab 7.12

path_file = fullfile(SCI, "modules","matio","tests","nonreg_tests","bug_11035.mat");
assert_checktrue(execstr("loadmatfile(path_file)","errcatch") == 0);
