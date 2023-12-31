// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005 - INRIA - Farid BELAHCENE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 1123 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1123
//
// <-- Short Description -->
//    I think this bug is related to other ones but the matlab
//    construction :
//
//    if(mod(N,2))N=N-1;t=t(1:N);xs=xs(1:N);xp=xp(1:N); x=x(1:N);end
//
//    leads to a error 43 the m2sci script

MFILECONTENTS = "if(true)t=1;end";
MFILE         = TMPDIR+"/bug1123.m";
SCIFILE       = TMPDIR+"/bug1123.sci";

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=[
    ""
    "if %t then"
    "  t = 1;"
    "end"];

if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
