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
// <-- NOT FIXED -->   6.0.0 -> 6.1.0
//
// <-- Non-regression test for bug 859 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/859
//
// <-- Short Description -->
//    M2SCI convert Matlab expression such as a(n,:)=b(m,:) (with
//    a==[])by a(n,:)=b(m,:) but execution crashes.

MFILECONTENTS = [
    "result=ones(10,10);";
    "m=1;";
    "for h=1:10";
    "  result_bis(m,:) = result(h,:);";
    "  m = m + 1;";
    "end"];

MFILE=TMPDIR+"/bug859.m";
SCIFILE=TMPDIR+"/bug859.sci";

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF = [
    "";
    "result = ones(10,10);";
    "m = 1;";
    "for h = 1:10";
    "  result_bis(m,1:length(result(h,:))) = result(h,:);";
    "  m = m+1;";
    "end;"];

if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
