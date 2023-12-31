// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2023 - 3DS - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 16541 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/16541
//
// <-- Short Description -->
// HDF5 load/save failed on tab properties

fig = figure("background", -2, ...
    "default_axes", "off", ...
    "dockable", "off", ...
    "infobar_visible", "off", ...
    "layout", "border", ...
    "menubar", "none", ...
    "menubar_visible", "off", ...
    "toolbar", "none", ...
    "visible", "off");

tab = uicontrol(fig, ...
    "style", "tab", ...
    "title_position", "bottom");

frame1 = uicontrol(tab, ...
    "style", "frame", ...
    "layout", "gridbag", ...
    "scrollable", %t, ...
    "string", "tab1");

frame2 = uicontrol(tab, ...
    "style", "frame", ...
    "layout", "gridbag", ...
    "scrollable", %t, ...
    "string", "tab2");

fig.visible = "on"

// saving the figure
save("fig.scg", "fig");
fig1 = fig;
// loading the figure back
load("fig.scg");
fig2 = fig;

assert_checkequal(fig1.children(1).title_position, fig2.children(1).title_position);
