// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 7898 -->
// <-- TEST WITH GRAPHIC -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7898
//
// <-- Short Description -->
// In an uicontrol of style "popupmenu", when the list in the "String" parameter has several repeated values, the returned selected value was always the first value in the list and not the currently selected one.

f = figure("figure_name", "bug_7898", ...
    "Position",[50 50 300 195]);

// Create the popup with two identicals items (first one and last one)
popup = uicontrol("Parent", f, ...
    "position", [10 180 170 20], ...
    "Style","popupmenu", ...
    "String", "10.23|5.34|5.33|5.34|10.23|5.34|50.33|10.23", ...
    "Tag","popupmenu");


// Select the first item and check that we can get its index
set(popup, "value", 1);
if get(popup, "value") <> 1 then pause;end

// Select the last item and check that we can get its index
set(popup, "value", 8);
if get(popup, "value") <> 8 then pause;end

delete(f);
