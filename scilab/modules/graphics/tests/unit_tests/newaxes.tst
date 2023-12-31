// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
f = scf();

plot();

frame1 = uicontrol(f, "style", "frame", ...
"position", [0, 0, 200, 200]);
newaxes(frame1);
plot2d();

frame2 = uicontrol(f, "style", "frame", ...
"position", [200, 200, 200, 200]);
newaxes(frame2);
plot3d();

// Plot demo => 2 Axes
// Axes 1 has 41 children
// Axes 2 has 3 children
assert_checkequal(size(f.children, "*"), 4);
assert_checkequal(f.children(3).type, "Axes");
assert_checkequal(f.children(3).children(1).type, "Compound");
assert_checkequal(size(f.children(3).children(1).children, "*"), 41);
assert_checkequal(f.children(4).type, "Axes");
assert_checkequal(f.children(4).children(1).type, "Compound");
assert_checkequal(size(f.children(4).children(1).children, "*"), 3);

// Plot3d demo => Plot3d
assert_checkequal(f.children(1).type, "uicontrol");
assert_checkequal(f.children(1).style, "frame");
assert_checkequal(f.children(1).children(1).type, "Axes");
assert_checkequal(f.children(1).children(1).children(1).type, "Plot3d");

// Plot2d Demo => Compound + 3 children
assert_checkequal(f.children(2).type, "uicontrol");
assert_checkequal(f.children(2).style, "frame");
assert_checkequal(f.children(2).children(1).type, "Axes");
assert_checkequal(f.children(2).children(1).children(1).type, "Compound");
assert_checkequal(size(f.children(2).children(1).children(1).children, "*"), 3);

delete(f);

f = gcf();
a = newaxes(f);
assert_checkequal(a.type, "Axes");
delete(f);

f = figure("default_axes", "off");
fra = uicontrol(f, "style", "frame", "position", [0 0 400 400]);
a = newaxes(fra);
assert_checkequal(a.type, "Axes");
delete(f);
