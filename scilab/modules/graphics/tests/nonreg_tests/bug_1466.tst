// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 1466 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1466
//
// <-- Short Description -->
// Driver function seems to crash Scilab 3.0.

x=linspace(0,2*%pi,500);
s=sin(10*x);
driver("PPM");
xinit(fullfile(TMPDIR,"bug_1466.ppm"));
plot2d(x,s);
// crash here in Scilab 3.0
xend();


