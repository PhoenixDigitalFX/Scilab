// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
// Copyright (C) 2019 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->
// <-- NOT FIXED -->
//
// <-- Non-regression test for bug 13766 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13766
//
// <-- Short Description -->
// Setting figure_size property lead to wrong display and figure properties values.

fg = figure();
fg.figure_size = [200,200];
assert_checkequal(fg.figure_size, [200,200]);

if getos()=="Windows" then
    wmin = getsystemmetrics("SM_CXMIN")
    hmin = getsystemmetrics("SM_CYMIN")
    fg.figure_size = [wmin, hmin];
    assert_checkequal(fg.figure_size, [wmin,hmin]);
    fg.figure_size(1) = wmin - 1; 
    assert_checkequal(fg.figure_size(1), wmin);
    // KO: On Windows 10, the minimal value actually set can be < wmin

    fg.figure_size(1) = hmin - 1;
    assert_checkequal(fg.figure_size(2), hmin);  // OK
end
