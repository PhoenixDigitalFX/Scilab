// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Alexandre HERISSE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 12868 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12868
//
// <-- Short Description -->
// There were several problems with the PULSE_SC block.

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_12868.zcos"));
Info = scicos_simulate(scs_m, list());

indices = find(A.values == 1);
true_indices = [2, 3, 4, 12, 13, 14, 22, 23, 24];
assert_checkequal(indices, true_indices);

