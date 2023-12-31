// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- ENGLISH IMPOSED -->
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9708 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9708
//
// <-- Short Description -->
// createNamedXXX did not check length of variable name
//
// Modified for Scilab 6 : no limit for variable name size
//

BUGNAME = "bug_9708";
ilib_verbose(0);

cd TMPDIR;
mkdir(BUGNAME);
cd(BUGNAME);
DEST = TMPDIR + "/" + BUGNAME + "/" + BUGNAME + ".c";
copyfile(SCI + "/modules/api_scilab/tests/nonreg_tests/" + BUGNAME + ".c", DEST);
assert_checkequal(isfile(DEST), %T);
ilib_build("lib" + BUGNAME,[BUGNAME,"sci_" + BUGNAME], BUGNAME + ".c", []);
exec loader.sce;
assert_checkequal(execstr("bug_9708()", "errcatch"), 0);


