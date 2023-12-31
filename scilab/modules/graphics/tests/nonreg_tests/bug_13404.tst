// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13404 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13404
//
// <-- Short Description -->
// rect property was not taken into account in polarplot.

t=linspace(0,1,100)*%pi*2;
polarplot(t/4-1,sin(t/10)-0.3,rect=[-0.18 -0.02 0.27 0.3]);
a=gca();
assert_checkequal(a.data_bounds, [-0.18,-0.02;0.27,0.3]);