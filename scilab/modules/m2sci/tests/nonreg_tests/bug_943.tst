// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Vincent COUVERT <vincent.couvert@inria.fr>
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 943 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/943
//
// <-- Short Description -->
//    Conversion of (if, elseif, else) structure leads to
//    mfile2sci failure in some particular indentation scheme.
//
//    Cyl_.m
//
//    function [v,G,J] = Cyl_(a,p1,p2,r)
//    v = (r^2)*abs(p2-p1)*pi;
//    l = p1-p2 ; d = 0.5*(p1+p2) ;
//    j1 = (r^2)/2. ; j2 = (r^2)/4. + (l^2)/12. + d^2 ;
//    if     (a==1), J = [j1,0.,0. ; 0.,j2,0. ; 0.,0.,j2] ; G =
//    [0.5*(p1+p2);0.;0.] ;
//    elseif (a==2), J = [j2,0.,0. ; 0.,j1,0. ; 0.,0.,j2] ; G =
//    [0.;0.5*(p1+p2);0.] ;
//    elseif (a==3), J = [j2,0.,0. ; 0.,j2,0. ; 0.,0.,j1] ; G =
//    [0.;0.;0.5*(p1+p2)] ;
//    else, J = [0.,0.,0. ; 0.,0.,0. ; 0.,0.,0.] ; G =
//    [0.;0.;0.] ; end,
//
//    Cyl2_.m
//
// ...

MFILECONTENTS=["a=10;";
"if     (a==1), J = [1 ; 2 ; 3] ; G = [4 ; 5 ; 6] ;";
"elseif (a==2), J = [1 ; 2 ; 3] ; G = [4 ; 5 ; 6] ;";
"elseif (a==3), J = [1 ; 2 ; 3] ; G = [4 ; 5 ; 6] ;";
"else, J = [1 ; 2 ; 3] ; G = [4 ; 5 ; 6] ; end,"];

MFILE=TMPDIR+"/bug943.m";
SCIFILE=TMPDIR+"/bug943.sci";

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=["";
"a = 10;";
"if a==1 then";
"  J = [1;2;3];  G = [4;5;6];";
"else";
"  if a==2 then";
"    J = [1;2;3];  G = [4;5;6];";
"  else";
"    if a==3 then";
"      J = [1;2;3];  G = [4;5;6];";
"    else";
"      J = [1;2;3];  G = [4;5;6];";
"    end";
"  end";
"end"];

if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
