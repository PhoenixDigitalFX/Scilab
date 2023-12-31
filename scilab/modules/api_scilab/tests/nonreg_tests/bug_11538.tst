// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 11538 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11538
//
// <-- Short Description -->
// check failed of to_wide_string function in WideString functions
// The conversion does not fail under Windows do we can not check that we have an error
//
// Modified for Scilab 6 : now "ascii(190:210)" work.
//

ilib_verbose(0);
test_path = get_absolute_file_path("bug_11538.tst");
currentpath = pwd();
cd TMPDIR;
mkdir("bug_11538");
cd("bug_11538");
copyfile(SCI+"/modules/api_scilab/tests/nonreg_tests/bug_11538.c" , "bug_11538.c");
ilib_build("gw_bug_11538", ["bug_11538", "sci_bug_11538"], "bug_11538.c", []);
exec loader.sce;

ierr = execstr("bug_11538(""abs"")", "errcatch");
assert_checktrue(ierr == 0);
ierr = execstr("bug_11538(ascii(190:210))", "errcatch");
assert_checktrue(ierr == 0);

