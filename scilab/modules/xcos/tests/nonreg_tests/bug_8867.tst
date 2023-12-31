// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- INTERACTIVE TEST -->
// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 8867 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8867
//
// <-- Short Description -->
// Exceptions are produced when deleting non-connected links.

xcos(SCI + "/modules/xcos/tests/nonreg_tests/bug_8867.zcos");

// Delete all the links
