// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 293 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/293
//
// <-- Short Description -->
//     plot() doesn't seem to like to plot large arrays.

// <-- TEST WITH GRAPHIC -->

x = zeros(1,20000);
plot(rand(x));

