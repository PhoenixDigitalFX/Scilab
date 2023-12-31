// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 14253 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14253
//
// <-- Short Description -->
// Problem with the affectation cmde "=" applied to a "list of struct"

st.a="aa";
LST=list(st);
LST1=LST;
LST(1).a="zz";
LST=LST1;
assert_checkequal(LST(1).a, "aa");
