// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3898 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3898
//
// <-- Short Description -->
// There is no way to check if mputl() has done his job :

fd = mopen(TMPDIR+'/text_1.txt','wt');
if mputl('Text', fd) <> %t then pause,end
mclose(fd);

// Open it in read-only mode
fd = mopen(TMPDIR+'/text_1.txt','rt');
if mputl('Text', fd) <> %f then pause,end
mclose(fd);

fd = mopen(TMPDIR+'/text_2.txt','w');
mclose(fd);
fd = mopen(TMPDIR+'/text_2.txt','r');

ierr = execstr("mfprintf(fd,''rrr'');","errcatch");
if ierr <> 999 then pause,end
mclose(fd);

