// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Vincent COUVERT <vincent.couvert@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 681 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/681
//
// <-- Short Description -->
//    m2sci doesn't translate "error" function.

MFILECONTENTS="error(''This is an error message'')";

MFILE=TMPDIR+"/bug681.m";
SCIFILE=TMPDIR+"/bug681.sci";

fd=mopen(MFILE,"w");
mputl(MFILECONTENTS,fd);
mclose(fd);

mfile2sci(MFILE,TMPDIR);

fd=mopen(SCIFILE,"r");
SCIFILECONTENTS=mgetl(fd,-1);
mclose(fd);

SCIFILECONTENTSREF=[""; "error(""This is an error message"")"];

correct=%T;
if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
