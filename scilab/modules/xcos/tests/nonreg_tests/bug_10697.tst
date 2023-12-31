// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 10697 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10697
//
// <-- Short Description -->
// Error report on superblock diagram is not supported.

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/demos/batch_simulation.zcos"));

// define a dummy post_xcos_simulate
clear post_xcos_simulate
function post_xcos_simulate(%cpr, scs_m, needcompile)
	disp("post_xcos_simulate")
endfunction

// simulate
xcos_simulate(scs_m, 4);

