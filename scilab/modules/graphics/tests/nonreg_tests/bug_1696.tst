// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - Digiteo - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 1696-->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1696
//
// <-- Short Description -->
// zoom_box properties only applies on X and Y axis.
// 

xSize = 10;
x = 1:xSize;
plot3d(x,x,rand(xSize, xSize));

// [xmin,ymin,xmax,ymax,zmin,zmax]
zoom_box = [-1,-1,10,10,-2,1];

axes = gca();
axes.zoom_box = zoom_box;
if (axes.zoom_box <> zoom_box) then pause; end
