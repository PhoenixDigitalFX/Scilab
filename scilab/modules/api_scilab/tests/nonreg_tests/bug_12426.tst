// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Simon MARCHETTO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 12426 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12426
//
// <-- Short Description -->
// By using addErrorMessage, random string error can be displayed.

ilib_verbose(0);
exec("SCI/modules/api_scilab/tests/nonreg_tests/build_bug_12426_gateway.sce");
exec(TMPDIR + "/bug_12426_gateway/loader.sce");

n = int32(1);
disp("add 1 error message");
addErrorMessage(n);

n = int32(4);
disp("add 4 error messages");
addErrorMessage(n);

n = int32(5);
disp("add 5 error messages");
addErrorMessage(n);

n = int32(6);
disp("add 6 error messages");
addErrorMessage(n);
