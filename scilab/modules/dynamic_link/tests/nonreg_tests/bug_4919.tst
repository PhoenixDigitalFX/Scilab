// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4919 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4919
// <-- Short Description -->
// If the source file was stored in TMPDIR, the dynamic link
//  was removing the content of this file.

if getos() <> 'Windows' then
  ilib_verbose(0);
  chdir(TMPDIR);
  f1=['int ext1c(int *n, double *a, double *b, double *c)'
    '{return 1;}'];

  mputl(f1,'fun100.c');

  ilib_for_link('ext1c','fun100.c',[],"c");
  exec loader.sce;
end

// =============================================================================
