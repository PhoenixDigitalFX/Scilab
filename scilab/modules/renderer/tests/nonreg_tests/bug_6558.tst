// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Pierre LANDO
//
//// This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- INTERACTIVE TEST -->
// <-- NOT FIXED -->  5.4.0 -> 6.0.2
//
// <-- Non-regression test for bug 6558 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6558
//
// <-- Short Description -->
// Infinite value was not plotted even if it was possible.


// Run this script and see the vertical line @ x=0

ieee(2);
x=linspace(-1,1,501);
y= exp(8*x) + 1 ./ abs(x);
plot(x,y);

