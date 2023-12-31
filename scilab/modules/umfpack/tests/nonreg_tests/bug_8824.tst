// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 8824 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8824
//
// <-- Short Description -->
// taucs_chfact returns a segfault (not the case in mode nwni)

N=512;
h = 1/(N+1);
x = h:h:1-h;
y = x;
[X,Y] = ndgrid(x,y);
F = (-2*(%pi^2))*(cos((2*%pi)*X) .*(sin(%pi*Y) .^2) + (sin(%pi*X).^2).*cos((2*%pi)*Y));
b = (h^2)*F(:);
s = [-1*ones(1,N-1) 2*ones(1,N) -1*ones(1,N-1)]';
i = [2:N 1:N 1:N-1]';
j = [1:N-1 1:N 2:N ]';
ij = [i j];
T = sparse(ij,s);
I = speye(N,N);
A = I .*. T + T .*. I;

assert_checktrue(execstr("hchol=taucs_chfact(A)","errcatch")==0);
assert_checktrue(execstr("taucs_chsolve(hchol,b)","errcatch")==0);
assert_checktrue(execstr("taucs_chdel(hchol)","errcatch")==0);
