// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 1760 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1760
//
// <-- Short Description -->
// Gif export does not rotate letters.


x=linspace(1,100);

set("current_figure",0); clf();
plot(x);
xtitle('title','x-axis','y-axis');

// in bmp-file everything is as in scilab-window
xs2bmp(0,TMPDIR + "/test.bmp");

// in gif-file the characters of y-label are rotated
xs2gif(0,TMPDIR + "/test.gif");
