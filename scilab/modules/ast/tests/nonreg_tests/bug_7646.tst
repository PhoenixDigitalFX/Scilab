// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enteprises - Pierre-Aime AGNEL
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 7646 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7646
//
// <-- Short Description -->
// matrix extraction on a transposed matrix was not possible

// <-- CLI SHELL MODE -->
A = [1 2; 3 4];

ierr = execstr("A''(1, 2)", "errcatch");
assert_checktrue(ierr == 0);
assert_checkequal(A'(1, 2), A(2, 1));
assert_checkequal(A'(2, 1), A(1, 2));

A(2, 1) = %i;
ierr = execstr("A.''(1, 2)", "errcatch");
assert_checktrue(ierr == 0);
assert_checkequal(A.'(1, 2), A(2, 1));
assert_checkequal(A.'(2, 1), A(1, 2));

