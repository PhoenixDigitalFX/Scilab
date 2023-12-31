// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 13222 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13222
//
// <-- Short Description -->
// ATOMS GUI is not showing any list module.
// ==> Related to the fact that figure() does not set the userdata property

f = figure("UserData", 13222);
assert_checkequal(f.userdata, 13222);