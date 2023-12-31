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
// <-- NOT FIXED -->    6.0.0 -> 6.1.0
//
// <-- Non-regression test for bug 853 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/853
//
// <-- Short Description -->
//    Error with the m2sci on personnal function :
//
//    function CORPABOT_vJuin04
//
//    % COntinuous Reltaive Phase Analyser Based On the Tangeant
//    (CO.R.P.A.B.O.T.)
//    % Salesse Robin UMR6152 June 17th 2004
//
//    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//    % Nettoyage du workspace
//    clear all;
//
//    % Nettoyage du Command Window
//    clc;
//
//    % Lancement du chronomètre
//    tic;
// ...

MFILECONTENTS=["dir_name=''path'';";
"dir_target=dir(dir_name);";
"for i=1:10";
"  RC(i)=[dir_name,''\'',dir_target(i).name];";
"end"];

MFILE=TMPDIR+"/bug853.m";
SCIFILE=TMPDIR+"/bug853.sci";

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=["";
    "dir_name = ""path"";";
    "dir_target = mtlb_dir(dir_name);";
    "for i = 1:10";
    "  RC(1,i) = dir_name+""\""+dir_target(i).name;";
    "end;"];


if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
