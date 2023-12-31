// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 10343 -->
// <-- TEST WITH GRAPHIC -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10343
//
// <-- Short Description -->
// Crash when creating an uicontrol with an invalid parent.

f=figure();
uicontrol("Parent", f); // ok

delete(f); // close the figure

refMsg = msprintf(_("Wrong value for ''%s'' property: A ''%s'' or ''%s'' handle expected.\n"), "Parent", "Figure", "Frame uicontrol");
assert_checkerror("uicontrol(""Parent"", f);", refMsg);
