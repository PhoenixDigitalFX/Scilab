// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// non regression test to check that the subwindow order (depth) on the screen is the same as its order within the figure children.

plot3d;
a1 = gca();
a1.grid = [1,2,3];
subplot(312); plot3d;
a2 = gca();
a2.grid = [4,5,6];
swap_handles(a1,a2);

// check that the surface is totally drawn.



