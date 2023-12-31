// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13807 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13807
//
// <-- Short Description -->
// Invalid margins when the visibility of figure was to off

fig = figure("figure_name", "TEST MARGINS", ...
"dockable", "off", ...
"axes_size", [950,550], ...
"infobar_visible", "off", ...
"toolbar", "none", ...
"menubar_visible", "on", ...
"menubar", "none", ...
"default_axes", "off", ...
"layout", "border", ...
"visible", "off");

f = uicontrol(fig, "style", "frame", ...
"layout", "gridbag");

f1 = uicontrol(f, "style", "frame", ...
"layout", "gridbag", ...
"constraints", createConstraints("gridbag", [1 1 1 1], [1 1], "both", "left"));
a1 = newaxes(f1);
//a1.auto_margins="off";
a1.filled = "off";
a1.tag = "axe";

f2 = uicontrol(f, "style", "frame", ...
"layout", "gridbag", ...
"constraints", createConstraints("gridbag", [1 2 1 1], [1 1], "horizontal", "left"));
uicontrol(f2, "style", "text", ...
"string", "test", ...
"layout", "gridbag", ...
"constraints", createConstraints("gridbag", [1 1 1 1], [1 1], "none", "left"));

sca(a1);
plot2d(1:10, 1:10);
a1.tight_limits = "on";
a1.x_label.text = "Time (s)";
a1.x_label.font_size = 2;
a1.x_location = "top";
legend("text", -1);
fig.visible="on";

// Check that the margins ont the top are visually correct.

