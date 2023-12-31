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
// <-- NOT FIXED -->  6.0.0 -> 6.1.0
//
// <-- Non-regression test for bug 946 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/946
//
// <-- Short Description -->
//    Code badly converted by mfile2sci when using particular
//    column vector initialization / assignment (see attachments).

MFILECONTENTS=["x=zeros(3,2);";"y=zeros(3,1);";"x=[1 0;0 0;0 0];";"y(1:3)=x(:,1);"];

MFILE=TMPDIR+"/bug946.m";
SCIFILE=TMPDIR+"/bug946.sci";

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=["";
		"x = zeros(3,2);";
		"y = zeros(3,1);";
		"x = [1,0;0,0;0,0];";
		"y(1:3) = x(:,1);"];

if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
