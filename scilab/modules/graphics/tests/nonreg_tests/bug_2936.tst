// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2936 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2936
//
// <-- Short Description -->
// The demo "Surface with hole 1" is not colorized (just blue, not multi-colored as in Scilab 4.1.2)
// 

t     = linspace(-%pi,%pi,40);
z     = sin(t)'*cos(t);
z1    = find(abs(z) > 0.5);
z(z1) = %inf*z1;
plot3d1(t,t,z);

// the plot should be colored (could be checked with some image processing).


