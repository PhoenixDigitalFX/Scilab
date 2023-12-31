// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13180 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13180
//
// <-- Short Description -->
// surf macro did not handle degenerate cases.

nx = 1;
ny = 10;
clf;
x = 1:nx;
y = 1:ny;
y = y';
surf(x, y, x.*.y);