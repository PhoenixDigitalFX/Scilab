// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 10428 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10428
//
// <-- Short Description -->
//
// Java apps shew a library load error in CLI

assert_checkerror("xcos", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "xcos"));
assert_checkerror("scinotes", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "scinotes"));
assert_checkerror("browsehistory", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "browsehistory"));
assert_checkerror("browsevar", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "browsevar"));
assert_checkerror("filebrowser", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "filebrowser"));
assert_checkerror("editvar(''a'')", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "editvar"));
assert_checkerror("driver(''png'')", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "driver"));
assert_checkerror("plot2d()", msprintf(_("Scilab ''%s'' function disabled in -nogui or -nwni mode.\n"), "plot2d"));
