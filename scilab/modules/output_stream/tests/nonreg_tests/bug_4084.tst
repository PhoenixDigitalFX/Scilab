// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- NOT FIXED -->  6.0.0 -> 6.0.2
// <-- Non-regression test for bug 4084 -->
//
// <-- Short Description -->
//
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4084
//

// print() function produces bad file. This doesn't occur with scilab-5.0.3.

s1 = -9.999999999;
s2 = 0.999999999999;

print(TMPDIR+"/bug.txt",s1,s2);
ref = [
" s2  =";
" ";
"    1.  ";
" s1  =";
" ";
"  -10.  "]
r = mgetl(TMPDIR+"/bug.txt");
if and(r<>ref) then pause,end
