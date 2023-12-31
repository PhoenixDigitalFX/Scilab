// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 1025 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1025
//
// <-- Short Description -->
//    winsid ne marche pas.

scf(1000);
scf(0);
A = winsid();
if or(A <> [1000,0]) then pause,end
close(winsid());