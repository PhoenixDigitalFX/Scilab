// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

//
// <-- Non-regression test for bug 3675 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3675
//
// <-- Short Description -->
//    Scilab 5.0.2 has issues when saving/loading gui (uicontrols,figure...)

f=figure();

h = uicontrol(f,"style","listbox", ..
    "position", [10 10 150 160],..
    "tag", "listbox_bug_3675");

h2 = uicontrol(...
    "parent", f,...
    "relief", "groove",...
    "style", "frame",...
    "position", [200 50 150 200],...
    "tag", "unnom");

// fill the list
set(h, "string", "un|mot|accentué");
// select item 2 and 3 in the list
h.min = 1;
h.max = 3;
h.value = [2 3];

// save
save(TMPDIR + filesep() + "bug_3675.bin", "f", "h", "h2")

// close the figure
delete(f);

assert_checkequal(size(winsid(), "*"), 0); // Check that saving the 'figure' function does not open a figure.

// load and redisplay
warning("off"); // Avoid warning about 'figure' function redefinition
load(TMPDIR + filesep() + "bug_3675.bin");

listbox = findobj("tag", "listbox_bug_3675");
assert_checkequal(get(listbox, "string"), ["un","mot","accentué"]);
