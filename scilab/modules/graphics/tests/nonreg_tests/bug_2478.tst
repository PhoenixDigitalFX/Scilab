// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2478 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2478
//
// <-- Short Description -->
// param3d line drawing may disappear when mark mode is on.

phi=[0:%pi/6:11*%pi/6];
nphi = length(phi); 
x1=[0;0]; y1=[0;0]; z1=[0;nphi];
x2=[zeros(phi);cos(phi)]; y2=[zeros(phi);sin(phi)];
z2 = [(0:1:nphi-1); (0:1:nphi-1)];
xx=[x1,x2]; yy=[y1,y2]; zz=[z1,z2];
clf(); param3d1(xx,yy,zz,10,30); param3d(xx(2,2:$),yy(2,2:$),zz(2,2:$))
fig = get("current_figure"); 
h = fig.children(1).children(1);  //children are those of the second param3d

//there is a "helix" line, connecting all the "steps" of the spiral staircase.
// now do:

h.mark_style = 14;

// check that the line drawing is still there

