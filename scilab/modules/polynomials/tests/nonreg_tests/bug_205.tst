// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 205 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/205
//
// <-- Short Description -->
//    Bug Report Id: 04062001110115540
//    determ oublie les termes de plus haut degre.
//
//    On Scilab 2.5 with " determ " function
//    The Error Messages are:
//
//    Commands: // scilab dit que le polynome caracteristique de
//    // cette matrice de dimension
//    // 30 est de degre 21
//    N=30
//    a=rand(N,N)
//    s=poly(0,'s')
//    p=determ(eye(N,N)*s-a)
//    degree(p)
//
//    Gaubert on Linux PPC version 2.2.13 distribution  with  X/kde as window manager
//    France  February 10, 2001 at 11:55:40
// <-- ENGLISH IMPOSED -->

N = 30;
A = rand(N,N);
P = determ( eye(N,N)*%s - A );

if degree(P)<>30 then pause,end
