// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Sylvestre Ledru
//
//// This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 10289 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10289
//
// <-- Short Description -->
//   Better error message if the file does not exist


assert_checkerror("xload(TMPDIR+""/does_not_exist"")", msprintf(_("%s: file %s does not exist.\n"), "xload", TMPDIR+"/does_not_exist"));

