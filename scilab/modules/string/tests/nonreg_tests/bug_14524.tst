// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- Non-regression test for bug 14524 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14524
//
// <-- Short Description -->
// Numeric locales were not set to standard "C" by default at scilab startup

format('e',10)
disp(1/2)
disp(0.5)

format('v',10)
disp(1/2)
disp(0.5)
