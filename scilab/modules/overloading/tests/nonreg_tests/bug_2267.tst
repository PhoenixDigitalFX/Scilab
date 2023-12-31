// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 2267 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2267
//
// <-- Short Description -->
// Wrong error message when ticks locations and labels have not the same sizes

clf(); plot2d(); a=gca();
errmsg=msprintf(_("Ticks location and label vectors must have the same size.\n"));
execstr("a.x_ticks.locations=0:2:6","errcatch"); //assert_checkerror does not catch the error here
assert_checkequal(lasterror(), errmsg);
execstr("a.x_ticks.labels=string([0:2:6])", "errcatch");
assert_checkequal(lasterror(), errmsg);

execstr("a.y_ticks.locations=-2:1:2", "errcatch");
assert_checkequal(lasterror(), errmsg);
execstr("a.y_ticks.labels=string([-2:1:2])", "errcatch");
assert_checkequal(lasterror(), errmsg);
close
