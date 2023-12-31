// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9917 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9917
//
// <-- Short Description -->
// mputl crashed with a wrong second parameter
//

x = "保存";
p = TMPDIR + '/foo';
assert_checkequal(mputl(x, p), %T);

cd(TMPDIR);
assert_checkequal(mputl(p, x), %T);
