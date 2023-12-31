// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Alexandre HERISSE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 11821 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11821
//
// <-- Short Description -->
// Running XcosPalAdd example from help led to deadlock


pal = xcosPal();
pal = xcosPalAddBlock(pal, "SUM_f");
pal = xcosPalAddBlock(pal, "BIGSOM_f");

status = xcosPalAdd(pal, "my Summation blocks");
assert_checktrue (status);

