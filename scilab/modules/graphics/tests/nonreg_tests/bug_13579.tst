// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13579 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13579
//
// <-- Short Description -->
// Annoying warnings when using bar(1, [1,2,3])

warning("on");
bar(1, [1 2 3]);
assert_checkequal(warning("query"), "on");

warning("off");
bar(1, [1 2 3]);
assert_checkequal(warning("query"), "off");
