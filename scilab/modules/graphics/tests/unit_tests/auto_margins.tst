// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// test auto_margins property

plot2d();
a = gca();

assert_checkequal(a.margins, [0.125 0.125 0.125 0.125]);
assert_checkequal(a.auto_margins, "on");

a.margins = [0 0 0 0];
assert_checkequal(a.margins, [0 0 0 0]);
assert_checkequal(a.auto_margins, "off");

a.auto_margins="on";
assert_checkequal(a.margins, [0.125 0.125 0.125 0.125]);
assert_checkequal(a.auto_margins, "on");

a.auto_margins="off";
assert_checkequal(a.margins, [0.125 0.125 0.125 0.125]);
assert_checkequal(a.auto_margins, "off");