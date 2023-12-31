// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 99927 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9927
//
// <-- Short Description -->
// Scilab crashed while executing 'XcosPalAdd' command


pal = xcosPal();
pal = xcosPalAddBlock(pal, "SUM_f");
pal = xcosPalAddBlock(pal, "BIGSOM_f");

assert_checkequal(xcosPalAdd(pal), %T);
