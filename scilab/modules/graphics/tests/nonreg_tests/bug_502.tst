// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 502 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/502
//
// <-- Short Description -->
//    Bug Report Id: 12442200382102810
//     I compiled Scilab-2.7.
//
//    On Scilab 2.7 with " GraphicWindow " function
//    The Error Messages are:
//      If the Graphic Window is "interfered" with,
//    for example moved, crosses path of another object
//    or even when graphic Window drop down box retracts,
//    then either the x-scale or y-scale of the 2d plot changes.
//    Commands:  An example like this did not show problem:
//    x=1:0.1:25;
//    y=x.^2;
//    plot2d(x,y);
//     Problem occurred, for example, with this:
//    x=-25:0.1:25;
//    y=x.^2
//    plot2d(x,y)
//
//
//
// ...


// set old_style on;
// remove old style graphics mode on trunk

x = -25:0.1:25;
y = x.^2;
plot2d(x,y);
if execstr("for k=1:20,clf(),sleep(100),end","errcatch","n") <>0 then pause,end
