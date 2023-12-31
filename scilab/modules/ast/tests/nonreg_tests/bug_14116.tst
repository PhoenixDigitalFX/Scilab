// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Dhruv Khattar
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- ENGLISH IMPOSED -->
// <-- CLI SHELL MODE -->
// <-- Non-regression test for bug 14116 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14116
//
// <-- Short Description -->
// Invalid exponent in case of complex exponents especially(0*%i)
// example x^(0*%i)

x = poly(0,"x");
s1 = 0*%i;
s2 = 2 + 0*%i;
s3 = [1 2 3 0*%i];
s4 = [1 0*%i; 2 4];
s5 = [1 2 4+0*%i 6];
s6 = [1 3+0*%i; 2 4];
assert_checkequal(x^s1, x^0);
assert_checkequal(x^s2, x^2);
assert_checkequal(x^s3, [x, x^2, x^3, 1]);
assert_checkequal(x^s4, [x, 1; x^2, x^4]);
assert_checkequal(x^s5, [x, x^2, x^4, x^6]);
assert_checkequal(x^s6, [x, x^3; x^2, x^4]);
assert_checkequal(x.^s1, x^0);
assert_checkequal(x.^s2, x.^2);
assert_checkequal(x.^s3, [x, x.^2, x.^3, 1]);
assert_checkequal(x.^s4, [x, 1; x.^2, x.^4]);
assert_checkequal(x.^s5, [x, x.^2, x.^4, x.^6]);
assert_checkequal(x.^s6, [x, x.^3; x.^2, x.^4]);
x = 1/x;
assert_checkequal(x^s1, x^0);
assert_checkequal(x^s2, x^2);
assert_checkequal(x^s3, [x, x^2, x^3, 1]);
assert_checkequal(x^s4, [x, 1; x^2, x^4]);
assert_checkequal(x^s5, [x, x^2, x^4, x^6]);
assert_checkequal(x^s6, [x, x^3; x^2, x^4]);
assert_checkequal(x.^s1, x^0);
assert_checkequal(x.^s2, x.^2);
assert_checkequal(x.^s3, [x, x.^2, x.^3, 1]);
assert_checkequal(x.^s4, [x, 1; x.^2, x.^4]);
assert_checkequal(x.^s5, [x, x.^2, x.^4, x.^6]);
assert_checkequal(x.^s6, [x, x.^3; x.^2, x.^4]);
