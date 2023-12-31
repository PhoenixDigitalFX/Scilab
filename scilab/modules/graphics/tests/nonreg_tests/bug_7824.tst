// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 7824 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7824
//
// <-- Short Description -->
// The properties of the title function did not support an indexed color.

clf();
title("Title","backgroundcolor",color("red"),"color",color("red"),"edgecolor",color("red"));
a = gca();
t = get(a, "title");
assert_checkequal(t.background, 5);
assert_checkequal(t.font_foreground, 5);
assert_checkequal(t.foreground, 5);
