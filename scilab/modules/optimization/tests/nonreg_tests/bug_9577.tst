// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- ENGLISH IMPOSED -->
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9577 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9577
//
// <-- Short Description -->
// neldermead_configure(): if -x0 is set, -numberofvariables is now optional.
// It was redundant to call neldermead_configure(nm, "-numberofvariables", X) if
// neldermead_configure(nm, "-x0", x0) had been set beforehand.
//

x0 = [1.2 1.9,1.5]';
nm = neldermead_new ();
nm = neldermead_configure(nm, "-x0", x0);
numberOfVar = neldermead_cget(nm, "-numberofvariables");
assert_checkequal(numberOfVar, 3);
