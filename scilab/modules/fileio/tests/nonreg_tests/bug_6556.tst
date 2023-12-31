//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 6556 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6556
//
// <-- Short Description -->
// fprintf() returned an error if it's called 2 times (or more) on the same file.

fd = mopen(TMPDIR+'/toto.txt','wt');
[units, typ, filenmes] = file();
k = find(filenmes == pathconvert(TMPDIR+'/toto.txt',%f,%t));
if type(units(k)) <> 1 then pause,end
ierr = execstr("mfprintf(units(k),''toto'')","errcatch");
mclose(fd);
if ierr <> 0 then pause,end
