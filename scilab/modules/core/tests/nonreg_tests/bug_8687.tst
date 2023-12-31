// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 8687 -->
//
// <-- CLI SHELL MODE -->
// 
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8687
//
// <-- Short Description -->
// Typeof() function fails on uint8, depending on the format.

format("e",10);
f_ref=format();
assert_checkequal(typeof(uint8(1:4)),"uint8");
f_res=format();
assert_checkequal(f_res,f_ref);
