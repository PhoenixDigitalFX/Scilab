// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - Digiteo - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2365-->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2365
//
// <-- Short Description -->
// plot3d3 without flags option removes ticks.
// 

plot3d3( [ 0,0; 10,10 ],[ 1,2;3,4 ],[ 0,2; 0,2 ] );

// check that ticks are present
axes = gca();
if (axes.axes_visible <> ["on", "on", "on"]) then pause; end
