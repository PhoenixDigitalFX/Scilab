// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - Digiteo - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2213-->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2213
//
// <-- Short Description -->
// legend misplaced in log plots
// 

legPos = [0.1,0.2];

clf();
plot2d("oll",0.1:10,0.1:10,-4,rect=[0.02 0.02 20 20]) ;
xtitle("verification of eq.(48) possible for","tau1","tau2");
leg = legend(["with C","without"],legPos,%t);

// check that legend upper left corner is at position [0.1,0.1]
// position of legend is relative to axes axes_bounds
axes = gca();
fig = gcf();

// first compute relative position in canvas
canvasPosX = axes.axes_bounds(1) + leg.position(1) * axes.axes_bounds(3);
canvasPosY = axes.axes_bounds(2) + leg.position(2) * axes.axes_bounds(4);

// get its pixel coordinate
canvasPosX = canvasPosX * fig.axes_size(1);
canvasPosY = canvasPosY * fig.axes_size(2);

// then get 2D position
[posX, posY] = xchange(canvasPosX, canvasPosY, "i2f");

// this should be close to legPos
if (norm([posX,posY] - legPos) / norm(legPos) > 0.05) then pause; end
