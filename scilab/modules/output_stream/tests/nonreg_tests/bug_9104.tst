// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- ENGLISH IMPOSED -->
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9104 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9104
//
// <-- Short Description -->
// 'warning' used in a diary scilab session added timestamp
// twice in the diary.
//

FILENAME_DIARY = TMPDIR +'/foo.log';
fd = diary(FILENAME_DIARY, 'new','prefix=YYYY-MM-DD hh:mm:ss');
warning("i like pizza very much")
diary(fd, 'close');
txt = mgetl(FILENAME_DIARY);
s = strsplit(txt(3),' ');
assert_checkequal(s($), 'much');
