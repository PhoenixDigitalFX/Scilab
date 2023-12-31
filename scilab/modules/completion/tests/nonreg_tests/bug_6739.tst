// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 6739 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6739
//
// <-- Short Description -->
// if a Scilab coded library function is redefined in a new library, completion
//   on its name maked Scilab crashed 
// 


// <-- CLI SHELL MODE -->

mkdir(TMPDIR,'test');
m=['function y = acosd(x)'
'  r=180/%pi     '
'  y = r*acos(x);'
'endfunction'];
mputl(m,TMPDIR+'/test/acosd.sci');
genlib('testlib',TMPDIR+'/test/');

acosd(3); //ok

[a,b,c,d,e]=completion('ac');
if a <> 'acos' then pause,end
if b <> [] then pause,end
if c <> [] then pause,end
if d == [] then pause,end
if e <> [] then pause,end
