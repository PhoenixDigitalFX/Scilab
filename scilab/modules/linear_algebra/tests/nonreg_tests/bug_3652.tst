//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3652 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3652
//
// <-- Short Description -->
// Instable behaviour of Lapack's zggev


Areal=[1 0 0;...
0 1 0;...
0 0 1];
A = complex(Areal,0);
Ereal=[1 1e-14 0;...
1e-14 1 0;...
0 0 1];
E = complex(Ereal,0);
Scomputed = spec(A,E);
Sexpected = [1-1e-14;1+1e-14;1];
if norm(Scomputed - Sexpected) > 1000 * %eps then pause,end


