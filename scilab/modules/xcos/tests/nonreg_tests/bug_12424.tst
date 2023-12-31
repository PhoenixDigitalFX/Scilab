// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Alexandre HERISSE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 12424 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12424
//
// <-- Short Description -->
// Calling lincos on a Derivative block makes scilab crash

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_12424.zcos"));
[X,U,Y,XP] = steadycos(scs_m, [], [], [], [], 1, 1:$);
sys = lincos(scs_m, X, U);
assert_checkequal(sys.A, []);
assert_checkequal(sys.B, []);
assert_checkequal(sys.C, []);
assert_checkequal(sys.D, 0.0);
assert_checkequal(sys.X0, []);
assert_checkequal(sys.dt, "c");

