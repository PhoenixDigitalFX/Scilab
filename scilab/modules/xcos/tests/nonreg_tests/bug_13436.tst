// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vladislav TRUBKIN
//
// This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
//<-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 13436 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13436
//
// <-- Short Description -->
// STEP was not delayed with Continuous Fix Delay
//

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_13436.zcos"));
xcos_simulate(scs_m, 4);

// step = 0 without the delay
assert_checkequal(res.values(:,1), ones(300, 1));
// step = 0 with the delay = 1
assert_checkequal(res.values(:,2), [zeros(10, 1); ones(290, 1)]);
// step = 1 with the delay = 1
assert_checkalmostequal(res.values(:,3), [zeros(20, 1); ones(280, 1)], 0, 1e-14);
// step = 2 with the delay = 2
assert_checkalmostequal(res.values(:,4), [zeros(40, 1); ones(260, 1)], 0, 1e-14);
