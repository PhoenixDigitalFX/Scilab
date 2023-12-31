// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7123 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7123
//
// <-- Short Description -->
// No completion was possible if the name of a variable is preceded by ~ or @ or < or >
// 

ilib_verbose(0);
ierr = exec(SCI+"/modules/completion/tests/utilities/build_primitives.sce","errcatch",-1);
if ierr <> 0 then pause, end
ierr = exec(TMPDIR + "/completion/loader.sce","errcatch",-1);
if ierr <> 0 then pause, end

blahblah = %t;
ref = 'blahbl';

r = getpartlevel('if ~blahbl');
if r <> ref then pause, end;

r = getpartlevel('if @blahbl');
if r <> ref then pause, end;

r = getpartlevel('if %t==blahbl');
if r <> ref then pause, end;

r = getpartlevel('if %t == blahbl');
if r <> ref then pause, end;

blahblah = 3;

r = getpartlevel('if 2>blahbl');
if r <> ref then pause, end;

r = getpartlevel('if 2 > blahbl');
if r <> ref then pause,end;

r = getpartlevel('if 2<blahbl');
if r <> ref then pause,end;

r = getpartlevel('if 2 < blahbl');
if r <> ref then pause,end;

// tabulation used in editor not in console
r = getpartlevel(ascii(9) + 'blahbl');
if r <> ref then pause,end;
