*// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 8717 -->
// <-- INTERACTIVE TEST -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8717
//
// <-- Short Description -->
// Bad window's title just after creation.

figure("figure_name", "Test");

// The window's title must be Test