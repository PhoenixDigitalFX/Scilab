// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 14784 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14784
//
// <-- Short Description -->
// Setting field of graphics handle using children($) failed.

f=figure();
f.children(1).user_data=1;
assert_checkequal(f.children(1).userdata, 1);
assert_checkequal(f.children(1).userdata, f.children($).userdata);
f.children($).user_data=2;
assert_checkequal(f.children($).userdata, 2);
f.children($).axes_visible="on";
assert_checkequal(f.children($).axes_visible, ["on", "on", "on"]);
close(f);
