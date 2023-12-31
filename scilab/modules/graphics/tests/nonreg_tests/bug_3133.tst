// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 3133 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3133
//
// <-- Short Description -->
// After having rotated an axis with the rotation button (toolbar), Alpha and Theta rotation angles displayed in the info bar are not updated if previously you have change the rotation angle with the rotation_angles property.

plot3d();

infoMessage = "Scilab p0wa";
my_fig = gcf();
my_fig.info_message = infoMessage;

my_axis = gca();
if my_axis.rotation_angles <> [70 70] then pause,end;
// should not change info message
my_axe.rotation_angles = [70, 70];


if (my_fig.info_message <> infoMessage) then pause; end



