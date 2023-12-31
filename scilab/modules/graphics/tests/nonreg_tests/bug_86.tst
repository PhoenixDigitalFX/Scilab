// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 86 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/86
//
// <-- Short Description -->
//  Contour labels are only displayed as integer

// create a contour between 0 and 1
contour(1:5,1:5,rand(5,5),1);

// all the labels should be strictl between 0 and 1
axes = gca();
compound = axes.children;

// half of the children are polylines half text
nbChildren = size(compound.children, '*');

for i=1:nbChildren,
  curHandle = compound.children(i);
  if (curHandle.type == "Text") then
    // check whether if their labels are not 0 or 1
    if (curHandle.text == "1" | curHandle.text == "0") then pause, end
  end
end

