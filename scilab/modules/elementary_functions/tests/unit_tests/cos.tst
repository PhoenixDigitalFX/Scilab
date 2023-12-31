// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
// Copyright (C) 2010 - DIGITEO - Michael Baudin
// Copyright (C) 2012 - Scilab Enterprises - Delamarre Cedric
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// unit tests for cos() function (element wise cosine)
// =============================================================================

// TODO : complex arithmetic

// 1. Interface
// ============

assert_checkfalse(execstr("cos()" ,"errcatch") == 0);
assert_checkfalse(execstr("cos(1,2)","errcatch") == 0);
assert_checkfalse(execstr("cos(''my string'')","errcatch") == 0);

// 2. Singular Values
// ==================

assert_checkequal(cos(0), 1);
assert_checkequal(cos(-0), 1);

// The following tests check cos for a small number of x in the range [0,pi].
// The variable x contains correctly rounded values of the exact value of x.
// The variable v contains correctly rounded values of the exact value of cos
// on the exact double representing the various values of x.
// For example, the floating point number which is closest to %pi/2 is
// 7074237752028440 * 2^-52, which can be written with the decimal string
// 1.570796326794896558D+00.
// We have cos(7074237752028440 * 2^-52) = 6.123233995736765886...*10^-17
// exactly.
// If Scilab had support for hex, we would have used it.
// The exact values are computed in Wolfram Alpha.
// We use more that 17 digits, which, if the decimal to binary conversion is
// correct, and if the rounding is round-to-nearest, must exactly produce
// values in this table.
// We avoid using values such as 2*%pi/3, which introduce one multiplication
// and one addition (the test fail is the multiplication or division
// is not accurate, while the current test is not sensitive to this, i.e.
// we test "cos", not "*").
// Failing this test may be caused by:
// * a bad decimal to binary conversion,
// * a wrong implementation of cos.
x = [
  5.235987755982988157D-01 // %pi/6
  7.853981633974482790D-01 // %pi/4
  1.047197551196597631D+00 // %pi/3
  1.570796326794896558D+00 // %pi/2
  2.094395102393195263D+00 // 2*%pi/3
  2.356194490192344837D+00 // 3*%pi/4
  2.617993877991494411D+00 // 5*%pi/6
  3.141592653589793116D+00 // %pi
];
v = [
    8.660254037844386755D-01
    7.071067811865475727D-01
    5.000000000000000994D-01
    6.123233995736765886D-17
   -4.999999999999998011D-01
   -7.071067811865474595D-01
   -8.660254037844386698D-01
   -1.000000000000000000D+00
];

C = cos(x);
rtol = ceil(abs(C-v)./abs(v)/%eps);
// Our tolerance is : get the exact floating point number,
// or its neighbour.
ulptol = 1;
assert_checkfalse(rtol > ulptol);
//
// Check symetry on these points
x = -x;
C = cos(x);
rtol = ceil(abs(C-v)./abs(v)/%eps);
// Our tolerance is : get the exact floating point number,
// or its neighbour.
ulptol = 1;
assert_checkfalse(rtol > ulptol);

//
// cos(x) == 1 for |x| < sqrt(2)*2^-27
// Reference:
// "Worst Cases for Correct Rounding of the Elementary Functions in Double Precision"
// Lefevre, Muller, 2003
// Table 2: Some results for small values in double precision, assuming
// rounding to the nearest.
//
// Check positive and negative normal numbers.
x = [2^(-1022:-27) -2^(-1022:-27)];
// Check that the values are close to 1.
// Our tolerance is : get the exact floating point number,
// or its neighbour.
C = cos(x);
rtol = ceil(abs(C-1)/%eps);
ulptol = 1;
assert_checkfalse(rtol > ulptol);
// Check that the values are lower or equal to 1.
// No matter how bad our library is, we must have abs(cos(x))<= 1.
// If this test fails, the math library is to be absolutely rejected.
assert_checkfalse(abs(C) > 1);
// Compute the number of floats for which cos(x)<>1.
// An excellent library should produce s=0.
// This failure happens for x=2^n and n usually close to -27.
notexact = sum(C<>1);
rtol = 30;
assert_checkfalse(notexact > rtol);

// Check that abs(cos(x))<= 1, for large normal floating point numbers x.
// If this test fails, the math library is to be absolutely rejected.
x = [2^(0:1023) -2^(0:1023)];
C = cos(x);
assert_checkfalse(abs(C) > 1);

// 3. Not A Number
// ===============

assert_checktrue(isnan(cos(%nan)));
assert_checktrue(isnan(cos(-%nan)));


// 4. Limit values
// ===============

assert_checktrue(isnan(real(cos(%inf))));
assert_checkequal(imag(cos(%inf)), 0);

assert_checktrue(isnan(real(cos(-%inf))));
assert_checkequal(imag(cos(-%inf)), 0);



// 5. Properties
// =============

// All the tests below are based on equalities of the form C=0,
// with C = f(A,B) and A, B matrices.
// We consider the elementwise absolute error abs(C), and
// focus on the maximum of this error, that is, we compute max(abs(C)).
// This absolute error is compared to atolratio * %eps, but it is
// expressed as max(abs(C))/%eps.
// Indeed, if this test fail, we first compute max(abs(C))/%eps, see
// its value (e.g. 0.9, 1.2 or 2.3) and set the tolerance to the minimum
// integer larger than this.

rand("seed",0);
A = rand(100,100);
B = rand(100,100);

// The ratio between the absolute tolerance and %eps.
atolratio = 5;

// cos(-x) = cos(x)
C = cos(-A) - cos(A);
assert_checkfalse(max(abs(C))/%eps > atolratio);

// cos(%pi - x) = - cos(x)
C = cos(%pi - A) + cos(A);
assert_checkfalse(max(abs(C))/%eps > atolratio);

// cos(%pi + x) = - cos(x)
C = cos(%pi + A) + cos(A);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos(2a) = 2 cos^2(a) - 1
C = cos(2*A) - 2 * (cos(A)).^2 + 1;
assert_checkfalse( max(abs(C))/%eps > atolratio);

//
// At this point, we do not test the accuracy of cos anymore:
// we test the matching between cos and sin.
// Thus, these tests may be put into cos.tst or sin.tst
//

// cos(%pi/2 - x) = sin(x)
C = cos(%pi/2 - A) - sin(A);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos(%pi/2 + x) = - sin(x)
C = cos(%pi/2 + A) + sin(A);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos^2(a) + sin^2(a) = 1
C = (cos(A)).^2 + (sin(A)).^2 - 1;
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos(a + b) = cos(a) cos(b) - sin(a) sin(b)
C = cos(A + B) - cos(A).*cos(B) + sin(A).*sin(B);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos(a -b) = cos(a) cos(b) + sin(a) sin(b)
C = cos(A - B) - cos(A).*cos(B) - sin(A).*sin(B);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// sin(a + b) = sin(a) cos(b) + sin(b) cos(a)
C = sin(A + B) - sin(A).*cos(B) - sin(B).*cos(A);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// sin(a -b) = sin(a) cos(b) - sin(b) cos(a)
C = sin(A - B) - sin(A).*cos(B) + sin(B).*cos(A);
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos(2a) = cos^2(a) - sin^2(a)
C = cos(2*A) - (cos(A)).^2 + (sin(A)).^2;
assert_checkfalse( max(abs(C))/%eps > atolratio);

// cos(2a) = 1 - 2 sin^2(a)
C = cos(2*A) - 1 + 2 * (sin(A)).^2;
assert_checkfalse( max(abs(C))/%eps > atolratio);

