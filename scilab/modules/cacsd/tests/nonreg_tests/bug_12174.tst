//<-- CLI SHELL MODE -->
//<-- NO CHECK REF -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 12174 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12174
//
// <-- Short Description -->
// The function routh_t gives incorrect output for all denominators that include
// gain value "k".

s = poly(0, 's');
k = poly(0,'k');
P = s*(s+7)*(s+11);
h = 1/P;
r_rat  = routh_t(h,k,%t);
r_poly = routh_t(h,k,%f);

ref_rat=[1 77; 18 k;(1386-k)/18 0; k 0];
numref = ref_rat;
numref(3)=1386 - k;
denr = r_rat.den;
denr = horner(denr,1);
denref = ones(ref_rat);
denref(3)=18;
ref_poly=[1 77; 18 k; 1386-k 0; 1386*k-k*k 0];

assert_checkalmostequal(r_rat.num/denr, numref/denref);
assert_checkequal(r_poly, ref_poly);
