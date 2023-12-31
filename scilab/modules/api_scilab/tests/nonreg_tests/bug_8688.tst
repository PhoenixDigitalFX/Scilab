// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 8688 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8688
//
// <-- Short Description -->
// fillMatrixOfString did not check available memory on stack.

BUGNAME = "bug_8688";
ilib_verbose(0);
if haveacompiler() then
  cd TMPDIR;
  mkdir(BUGNAME);
  cd(BUGNAME);
  DEST = TMPDIR + "/" + BUGNAME + "/" + BUGNAME + ".c";
  copyfile(SCI + "/modules/api_scilab/tests/nonreg_tests/" + BUGNAME + ".c", DEST);
  assert_checkequal(isfile(DEST), %T);
  ilib_build("lib" + BUGNAME,[BUGNAME,"sci_" + BUGNAME], BUGNAME + ".c", []);
  exec loader.sce;
  assert_checkequal(execstr("bug_8688()", "errcatch"), 0);
end

