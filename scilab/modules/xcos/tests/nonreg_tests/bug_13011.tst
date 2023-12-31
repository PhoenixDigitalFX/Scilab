// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->

// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 13011 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13011
//
// <-- Short Description -->
// Fails under Mac OS X 10.9

ilib_verbose(0);

importXcosDiagram(SCI+"/modules/xcos/tests/nonreg_tests/bug_12384.zcos");
xcos_simulate(scs_m, 4);

