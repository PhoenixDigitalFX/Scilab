// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- INTERACTIVE TEST -->
// <-- Non-regression test for bug 2749 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2749
//
// <-- Short Description -->
// graphics demo eats memory at will

// initialisation

// set double buffer mode to avoid blinking animation
//---------------------------------------------------
curFig = gcf();clf();  // erase window

//The surface definition 
//----------------------
x=linspace(-%pi,%pi,50);
y=x;
Z=sin(x)'*cos(y);

//Creates and set graphical entities which represent the surface
//--------------------------------------------------------------

contour(x,y,Z,10,35,45,'X@Y@Z',[0,2,4])
title("rotation of a 3d contour","fontsize",3)
curAxe = gca();	
//Set the evolution of the view angle  Alpha
//---------------------------------------------------
A=35:360;

// get memory before the rotation
initFreeMemory = getmemory();

//animation loop
//--------------
//use realtime to slow down the loop
realtimeinit(0.05);//set time step (0.05 seconds)  and date reference
for i=1:size(A,'*')
  realtime(i); //wait till date 0.05*i seconds
  curAxe.rotation_angles = [45,A(i)];
end

// check memory consumption
// user complained that it use to use 20Mb of memory
endFreeMemory = getmemory();

// give 4 meg
if ((initFreeMemory - endFreeMemory) > 4096) then pause; end

