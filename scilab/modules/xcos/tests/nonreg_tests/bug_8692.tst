// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 8692 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8692
//
// <-- Short Description -->
// Blocks null values produce an exception on export.

// open then export a diagram with null values
status = importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_8692.zcos");
if ~status then pause, end

