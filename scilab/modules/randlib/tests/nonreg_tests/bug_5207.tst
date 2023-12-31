// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 5207 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/5207
//
// <-- Short Description -->
// grand did not managed 3-D inputs/outputs

//dimension as input parameters

//init mt generator with seed = 1337
grand("setsd", 1337);
a = grand(3, 4, 5, "def");
grand("setsd", 1337);
ref = grand(1, 3 * 4 * 5, "def");
ref = matrix(ref, [3, 4, 5]);
assert_checkequal(a, ref);

grand("setsd", 1337);
a = grand(3, 4, 5, 6, "def");
grand("setsd", 1337);
ref = grand(1, 3 * 4 * 5 * 6, "def");
ref = matrix(ref, [3, 4, 5, 6]);
assert_checkequal(a, ref);

//dimension from size of input parameter
grand("setsd", 1337);
Z = zeros(3,4,5);
a = grand(Z, "def");
grand("setsd", 1337);
ref = grand(1, 3 * 4 * 5, "def");
ref = matrix(ref, [3, 4, 5]);
assert_checkequal(a, ref);

grand("setsd", 1337);
Z = zeros(3,4,5,6);
a = grand(Z, "def");
grand("setsd", 1337);
ref = grand(1, 3 * 4 * 5 * 6, "def");
ref = matrix(ref, [3, 4, 5, 6]);
assert_checkequal(a, ref);

