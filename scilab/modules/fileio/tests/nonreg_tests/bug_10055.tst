// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 10055 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10055
//
// <-- Short Description -->
// Wrong default search filter
//


x = "保存";
targetDir=TMPDIR+"/sub/";
mkdir(targetDir);
p = targetDir + 'foo';
fd = mopen(p,'wt');
p2 = targetDir + 'foo.2';
fd2 = mopen(p2,'wt');
cd(targetDir);
assert_checkequal(mputl(p, fd), %T);
assert_checkequal(mputl(p, fd2), %T);
assert_checktrue(isfile(p));
assert_checktrue(isfile(p2));
assert_checkfalse(and(size(findfiles(pwd()))==[1,1]));
assert_checkequal(size(findfiles(pwd())),[2,1]);
