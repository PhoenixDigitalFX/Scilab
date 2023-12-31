// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 11349 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11349
//
// <-- Short Description -->
// colordef("black") returned an error about an unknown property.

assert_checktrue(execstr("colordef(""black"")", "errcatch") == 0);