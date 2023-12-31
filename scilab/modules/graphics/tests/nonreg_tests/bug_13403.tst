// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13403 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13403
//
// <-- Short Description -->
// Formating of simple Y labels regressed (wrt 5.4.1)

t = 1:0.1:7;
plot2d(t,sin(t),rect=[0.5 -0.5 5 0.7]);
a=gca();
assert_checkequal(a.y_ticks.labels, ["-0.5";"-0.4";"-0.3";"-0.2";"-0.1";"0";"0.1";"0.2";"0.3";"0.4";"0.5";"0.6";"0.7"]);