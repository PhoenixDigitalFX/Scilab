// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 9851 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9851
//
// <-- Short Description -->
// Error message occurs because of a cut-off frequency of 0.25Hz with irr

hz=iir(2,'lp','butt',[0.25 0.25],[0 0]);
z=poly(0,'z');
num=0.292893218813+0.585786437627*z+0.292893218813*z^2;
den=0.171572875254+5.55111512d-17*z+z^2;
assert_checkalmostequal(coeff(hz.num), coeff(num), 1d-9);
assert_checkalmostequal(coeff(hz.den), coeff(den), 1d-9);
