// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// test xsetech()

f = gcf();
a1 = gca();

//
// xsetech(wrect)
//

// Assert axes fill all figure
assert_checkequal(a1.axes_bounds, [0 0 1 1]);
// Assert figure only has 1 child
assert_checkequal(size(f.children), [1 1]);
assert_checkequal(f.children(1).type, "Axes");

xsetech([0,0,0.1,0.1]);
a2 = gca();
// Assert figure has two children
assert_checkequal(size(f.children), [2 1]);
assert_checkequal(a2.axes_bounds, [0 0 0.1 0.1]);
// a2 == a1: simply check on axes bounds
assert_checkequal(a1.axes_bounds, [0 0 1 1]);

xsetech([0.9 0.9 0.1 0.1])
a3 = gca();
// Assert figure has three children now
assert_checkequal(size(f.children), [3 1]);
assert_checkequal(a1.axes_bounds, [0 0 1 1]);
assert_checkequal(a2.axes_bounds, [0 0 0.1 0.1]);
assert_checkequal(a3.axes_bounds, [0.9 0.9 0.1 0.1]);

