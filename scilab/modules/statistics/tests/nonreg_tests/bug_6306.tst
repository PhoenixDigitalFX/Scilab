// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 6306 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6306
//
// <-- Short Description -->
// It was not possible to retrieve the data computed by histplot.
// Also, new function histc to compute histogram data instead of plotting it.

d = rand(1, 10000, "normal");
normHist = "densityNorm,normWith:all";
[cfC, tmp, tmp, indC] = histc(d, 20, normHist);
[cfP, indP] = histplot(20, d);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);

[cfC, tmp, tmp, indC] = histc(d, 20);
[cfP, indP] = histplot(20, d, normalization=%f);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);

[cfC, tmp, tmp, indC] = histc(d,[-1 0 1], normHist);
[cfP, indP] = histplot([-1 0 1], d);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);

[cfC, tmp, tmp, indC] = histc(d, [-1 0 1]);
[cfP, indP] = histplot([-1 0 1], d, normalization=%f);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);



grand("setsd", 0);
lambda = 2;
D = grand(100000, 1, "exp", 1/lambda);
[cfC, tmp, tmp, indC] = histc(D, 40, normHist);
[cfP, indP] = histplot(40, D);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);

[cfC, tmp, tmp, indC] = histc(D, 40);
[cfP, indP] = histplot(40, D, normalization=%f);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);

[cfC, indC] = histc([0 7], D);
[cfP, indP] = histplot([0 7], D);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);

[cfC, tmp, tmp, indC] = histc(D, [0 7]);
[cfP, indP] = histplot([0 7], D, normalization=%f);

assert_checkequal(indC, indP);
assert_checkalmostequal(cfC, cfP);
