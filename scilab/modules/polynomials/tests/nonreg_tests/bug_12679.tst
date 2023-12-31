// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 12679 -->
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12679
//
// <-- Short Description -->
// Checks on gcd() and lcm() arguments

// Run with test_run('polynomials', 'bug_12679', ['no_check_error_output'])

////////////////// gcd
// Normal behavior, with polynomials
s = poly(0, "s");
p = [s, s*(s+1)^2, 2*s^2+s^3];
[pgcd, u] = gcd(p);
assert_checkequal(clean(p*u), [0 0 s]);
// Complex polynomials should yield an error

// Normal behavior, with integers
V = [2^2*3^5 2^3*3^2 2^2*3^4*5];
V_int = int32(V);
[thegcd, U] = gcd(V);
[thegcd, U_int] = gcd(V);
assert_checkequal(V*U, [0 0 36]);
assert_checkequal(V_int*U_int, int32([0 0 36]));
assert_checkequal(gcd(uint8([15 20])), uint8(5));
assert_checkequal(gcd([iconvert(15, 4) iconvert(20, 4)]), int32(5));
assert_checkequal(gcd(iconvert([15 20], 4)), int32(5));
// Trying to use booleans, strings or decimals should yield an error
refMsg2 = msprintf(_("%s: Wrong type for argument #%d: Decimal or encoded integers or Polynomial expected.\n"), "gcd", 1);
assert_checkerror("gcd(%t);", refMsg2);
refMsg3 = msprintf(_("%s: Wrong values for argument #%d: Integer values expected.\n"), "gcd", 1);
assert_checkerror("gcd(1.5);", refMsg3);
assert_checkerror("gcd(""string"");", refMsg2);


////////////////// lcm
// Normal behavior, with polynomials
s = poly(0, "s");
p = [s, s*(s+1)^2, s^2*(s+2)];
[pp, fact] = lcm(p);
assert_checkequal(pp, [2*s^2 + 5*s^3 + 4*s^4 + s^5]);

// Normal behavior, with integers
V = [2^2*3^5 2^3*3^2 2^2*3^4*5];
V_int = int32(V);
assert_checkequal(lcm(V), 9720);
assert_checkequal(lcm(V_int), 9720);
// Trying to use booleans, strings or decimals should yield an error
msg = msprintf(_("%s: Wrong type for argument #%d: Array of integers or polynomials expected.\n"), "lcm", 1);
assert_checkerror("lcm(%t);", msg);
assert_checkerror("lcm(""string"");", msg);
msg = msprintf(_("%s: Wrong values for argument #%d: Integer values expected.\n"),"lcm", 1);
assert_checkerror("lcm(1.5);", msg);
