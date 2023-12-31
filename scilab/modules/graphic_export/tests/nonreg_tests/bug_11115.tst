// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 11115 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11115
//
// <-- Short Description -->
// A graphic window was opened with two xend()
driver("JPEG")
xinit(TMPDIR+"/plot3d.jpg")
plot3d()
xend()
assert_checktrue(isfile(TMPDIR+"/plot3d.jpg"));
xinit(TMPDIR+"/plot2d.jpg")
plot2d()
xend()
assert_checktrue(isfile(TMPDIR+"/plot2d.jpg"));
