// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Vincent COUVERT <vincent.couvert@inria.fr>
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->
// <-- NOT FIXED -->     6.0.0 -> 6.1.0
//
// <-- Non-regression test for bug 750 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/750
//
// <-- Short Description -->
//    I try to translate to Scilab the benchmark m-file of matlab.
//    This should give a comparison of scilab and matlab execution
//    times.
//
//    It does not translate. Too bad...

MFILECONTENTS=["t=[];";"cputime;";"t(10)=cputime;"];

MFILE=TMPDIR+"/bug750.m";
SCIFILE=TMPDIR+"/bug750.sci";

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=[
    ""
    "t = [];"
    "timer;"
    "t(1,10) = timer();"];


if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
