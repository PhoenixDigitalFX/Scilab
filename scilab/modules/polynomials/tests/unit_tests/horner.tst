// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - CNES - Alain Lamy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// --------------------------------
// p = polynomial
s=poly(0,"s");
p0 = [1+s+3*s^2];
p = p0;

r1 = horner(p,[1]);
assert_checkequal(r1, 5);

r1 = horner(p,[2]);
assert_checkequal(r1, 15);

r1 = horner(p,[1,2]);
assert_checkequal(r1, [5 15]);

r1 = horner(p,[3,4]);
assert_checkequal(r1, [31 53]);

r1 = horner(p,[1,2;3,4]);
assert_checkequal(r1, [5,15;31,53]);


// --------------------------------
// p = row vector
p = [p0,p0^2];

r1 = horner(p,[1]);
assert_checkequal(r1, [5 25]);

r1 = horner(p,[2]);
assert_checkequal(r1, [15 225]);

r1 = horner(p,[1,2]);
assert_checkequal(r1, [5,15,25,225]);

r1 = horner(p,[3,4]);
assert_checkequal(r1, [31,53,961,2809]);


r1 = horner(p,[1,2;3,4]);
assert_checkequal(r1, [5,15,25,225;31,53,961,2809]);

// --------------------------------
// p = column vector
p = [p0;p0^2];

r1 = horner(p,[1]);
assert_checkequal(r1, [5; 25]);

r1 = horner(p,[1,2]);
assert_checkequal(r1, [5,15;25,225]);

r1 = horner(p,[3,4]);
assert_checkequal(r1, [31,53;961,2809]);

r1 = horner(p,[1,2;3,4]);
assert_checkequal(r1, [5,15;31,53;25,225;961,2809]);

// --------------------------------
// p = matrix
p = [p0,p0^2; p0, p0^3; p0, p0^4];

r1 = horner(p,[1]);
assert_checkequal(r1, [5,25;5,125;5,625]);

r1 = horner(p,[2]);
assert_checkequal(r1, [15,225;15,3375;15,50625]);

r1 = horner(p,[1,2]);
assert_checkequal(r1, [5,15,25,225;5,15,125,3375;5,15,625,50625]);

r1 = horner(p,[3,4]);
assert_checkequal(r1, [31,53,961,2809;31,53,29791,148877;31,53,923521,7890481]);

r1 = horner(p,[1,2;3,4]);
assert_checkequal(r1, [5,15,25,225;31,53,961,2809;5,15,125,3375;31,53,29791,148877;5,15,625,50625;31,53,923521,7890481]);

// --------------------------------
// p = rational
p = (1 + p0 ) / (2 + p0^2 + p0^3);

r1 = horner(p,[1]);
assert_checkalmostequal(r1, 0.0394737, 10^-6);

r1 = horner(p,[2]);
assert_checkalmostequal(r1, 0.0044420, 10^-5);

r1 = horner(p,[1,2]);
assert_checkalmostequal(r1, [0.0394737,0.0044420], 10^-5);

r1 = horner(p,[3,4]);
assert_checkalmostequal(r1, [0.0010405,0.0003560], 10^-4);

r1 = horner(p,[1,2;3,4]);
assert_checkalmostequal(r1, [0.0394737,0.0044420;0.0010405,0.0003560], 10^-4);

