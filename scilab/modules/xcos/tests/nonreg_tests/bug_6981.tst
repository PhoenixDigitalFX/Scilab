// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- INTERACTIVE TEST -->
// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 6981 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6981
//
// <-- Short Description -->
// The Xcos save dialog was ignored when using the Scilab exit() command.

xcos
// Add any block (perform modifications)
exit
// Check that scilab don't exit before the end of the save.
