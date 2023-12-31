// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - Artem GLEBOV
// Copyright (C) 2011 - DIGITEO - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- ENGLISH IMPOSED -->
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7409 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7409
//
// <-- Short Description -->
//

BUGNAME = "sci_empty_test";
ilib_verbose(0);
if haveacompiler() then
  cd TMPDIR;
  mkdir(BUGNAME);
  cd(BUGNAME);
  DEST = TMPDIR + "/" + BUGNAME + "/" + BUGNAME + ".cpp";
  copyfile(SCI + "/modules/api_scilab/tests/nonreg_tests/" + BUGNAME + ".cpp", DEST);
  assert_checkequal(isfile(DEST), %T);
  ilib_build("lib" + BUGNAME,[BUGNAME, BUGNAME], BUGNAME + ".cpp", []);
  exec loader.sce;
  [a,b]=sci_empty_test();
  assert_checkequal(a,[]);
  assert_checkequal(b,[]);
end

