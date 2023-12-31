// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 13709 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13709
//
// <-- Short Description -->
//    The position of the first of each distinct element was sometimes wrong.
// =============================================================================

ind = [2 1 1;
2 1 1;
4 1 1;
4 2 2;
4 2 2;
5 3 3;
5 3 3;
5 4 4];

[Uind, kindex] = unique(ind, "r");

expUind = [2 1 1;
4 1 1;
4 2 2;
5 3 3;
5 4 4];

expk = [1 3 4 6 8]';
assert_checkequal(Uind, expUind);
assert_checkequal(kindex, expk);
