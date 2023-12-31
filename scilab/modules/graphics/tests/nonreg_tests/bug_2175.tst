// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - Digiteo - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2175-->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2175
//
// <-- Short Description -->
// "contour2d" prints level numbers partially outside the rect.
// 

bounds = [1,1,10,10];
contour2d(1:10,1:10,rand(10,10),5,rect=bounds);

// check that texts created by contour2d are inside the box
axes = gca();
for compIndex = 1:size(axes.children,'*'),
  compound = axes.children(compIndex);
  for hdlIndex = 1:size(compound.children,'*')
    hdl = compound.children(hdlIndex);
    if (hdl.type == 'Text') then
	  box = stringbox(hdl);
	  if (  box(1,1) < bounds(1) | box(2,1) < bounds(2) | box(1,3) > bounds(3) | box(2,3) > bounds(4)) then pause; end
	end
  end
end
