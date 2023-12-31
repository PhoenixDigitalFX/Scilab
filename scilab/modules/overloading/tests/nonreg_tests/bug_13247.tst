//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
//
// <-- Non-regression test for bug 13247 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13247
//
// <-- Short Description -->
// hypermatrix in structure definition did not work properly

z = zeros(2,2,2);
s.f = z;
assert_checkequal(typeof(s), "st");
assert_checkequal(s.f, z);
