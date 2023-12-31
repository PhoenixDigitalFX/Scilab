// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Clément DAVID
// Copyright (C) 2017 - Scilab Enterprises - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 9810 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9810
//
// <-- Short Description -->
// Matrix inversion error message update

exec(SCI + "/modules/xcos/tests/nonreg_tests/bug_9810.sce");
status = importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_9810.zcos");
if ~status then pause, end

// compile and simulate
xcos_simulate(scs_m, 4);

