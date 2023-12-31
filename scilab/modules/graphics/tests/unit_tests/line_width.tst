// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// test line_width and marks_count (legend properties)

t = linspace(0,10,11);
plot(t,t);
e1 = gce();
e1.children.line_mode = "off";
e1.children.mark_mode = "on";
e1.children.mark_size = 8;
legend("test", 2);
e2 = gce();

// test defaults
assert_checkequal(e2.line_width, 0.1);
assert_checkequal(e2.marks_count, 3);

// modify and test
e2.line_width = 0.05;
assert_checkequal(e2.line_width, 0.05);

e2.marks_count = 0;
assert_checkequal(e2.marks_count, 0);

e2.line_width = 0.0432;
assert_checkequal(e2.line_width, 0.0432);

e2.marks_count = 1;
assert_checkequal(e2.marks_count, 1);

assert_checkerror("set(e2,''line_width'',-0.1)", msprintf(_("Wrong value for ''%s'' property: Must be between %d and %d.\n"), "line_width", 0, 1));
assert_checkerror("set(e2,''line_width'',1.2)", msprintf(_("Wrong value for ''%s'' property: Must be between %d and %d.\n"), "line_width", 0, 1));
assert_checkerror("set(e2,''marks_count'',-1)", msprintf(_("Wrong value for ''%s'' property: Must be between %d and %d.\n"), "marks_count", 0, 3));
assert_checkerror("set(e2,''marks_count'',4)", msprintf(_("Wrong value for ''%s'' property: Must be between %d and %d.\n"), "marks_count", 0, 3));