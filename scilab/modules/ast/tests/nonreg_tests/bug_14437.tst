// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 14437 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14437
//
// <-- Short Description -->
// Problem with the affectation cmde "=" applied to a "list of struct"

lst=list();
lst(1)=struct("f",[1,2]);
lst(2)=lst(1);
lst(2).f(2)=3;

assert_checkequal(lst(1).f, [1,2]);
assert_checkequal(lst(2).f, [1,3]);
