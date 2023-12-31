// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// unit tests for detr function
// =============================================================================

assert_checkfalse(execstr("detr()"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong number of input argument: %d expected.\n"), "detr", 1);
assert_checkerror("detr()", refMsg);

assert_checkfalse(execstr("detr(""r"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A floating point number or polynomial or rational fraction array expected.\n"), "detr", 1);
assert_checkerror("detr(""r"")", refMsg);

assert_checkfalse(execstr("detr([1;2])"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong size for input argument #%d: A square matrix expected.\n"), "detr", 1);
assert_checkerror("detr([1;2])", refMsg);

A = [1 1;1 2];
d = detr(A);
assert_checkequal(d, 1);
assert_checkequal(d, det(A));

A = %i*A;
d = detr(A);
assert_checkequal(d, complex(-1, 0));
assert_checkequal(d, det(A));

A = [1 3 5;2 3 4;8 4 9];
d = detr(A);
assert_checkequal(d, -27);
assert_checkalmostequal(d, det(A));

A=  A-%i;
d = detr(A);
assert_checkequal(d, complex(-27,9));
assert_checkalmostequal(d, det(A), [], %eps);

A = [1+%s 1; 1 2+%s];
d = detr(A);
assert_checkequal(d, 1+3*%s+%s^2);
assert_checkequal(d, det(A));

A = [1*%s 3 5*%s^2;2 3*%s 4; 8*%s^3 4*%s^2 9*%s];
d = detr(A);
assert_checkequal(d, -54*%s+107*%s^3+40*%s^4-120*%s^6);
assert_checkalmostequal(coeff(d), coeff(det(A)), [], %eps);

A = [1/%s 1; 1 2/%s];
d = detr(A);
assert_checkequal(d, (2-%s^2)/%s^2);
assert_checkequal(d, det(A));

A = [1/%s 3 5/%s^2;2 3/%s 4; 8/%s^3 4/%s^2 9/%s];
d = detr(A);
assert_checkequal(d, (-120 +40*%s^2+107*%s^3-54*%s^5)/%s^6);
d2 = det(A);
assert_checkalmostequal(coeff(d.num), coeff(d2.num), [], %eps);
assert_checkalmostequal(coeff(d.den), coeff(d2.den), [], %eps);
