// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2009 - INRIA - Michael Baudin
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->

// 1. Test with a scalar argument
function y = myfunction (x)
    y = x*x;
endfunction

x = 1.0;
expected = 2.0;
// 1.1 With default parameters
computed = numderivative(myfunction, x);
assert_checkalmostequal ( computed , expected , 1.e-11 );
// 1.2 Test order 1
computed = numderivative(myfunction, x, [], 1);
assert_checkalmostequal ( computed , expected , 1.e-8 );
// 1.3 Test order 2
computed = numderivative(myfunction, x, [], 2);
assert_checkalmostequal ( computed , expected , 1.e-11 );
// 1.4 Test order 4
computed = numderivative(myfunction, x, [], 4);
assert_checkalmostequal ( computed , expected , 1.e-13 );
// 1.5 Compute second numderivative at the same time
Jexpected = 2.0;
Hexpected = 2.0;
[Jcomputed, Hcomputed] = numderivative(myfunction, x);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-11 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );
// 1.6 Test order 1
[Jcomputed, Hcomputed] = numderivative(myfunction, x, [], 1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-8 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-6 );
// 1.7 Test order 2
[Jcomputed, Hcomputed] = numderivative(myfunction, x, [], 2);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-11 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );
// 1.8 Test order 4
[Jcomputed, Hcomputed] = numderivative(myfunction, x, [], 4);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-13 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-11 );
// 1.9 Configure the step
computed = numderivative(myfunction, x, 1.e-1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-13 );
// 1.10 Configure the step
[Jcomputed, Hcomputed] = numderivative(myfunction,x,1.e-1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-13 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-11 );

// 2. Test with a vector argument
function y = myfunction2 (x)
    y = x(1)*x(1) + x(2) + x(1)*x(2);
endfunction
x = [1.0; 2.0];
Jexpected = [4. 2.];
Hexpected = [2. 1. 1. 0.];
// 2.1 With default parameters
computed = numderivative(myfunction2, x);
assert_checkalmostequal ( computed , Jexpected , 1.e-10 );
// 2.2 Test order 1
computed = numderivative(myfunction2, x, [], 1);
assert_checkalmostequal ( computed , Jexpected , 1.e-8 );
// 2.3 Test order 2
computed = numderivative(myfunction2, x, [], 2);
assert_checkalmostequal ( computed , Jexpected , 1.e-10 );
// 2.4 Test order 4
computed = numderivative(myfunction2, x, [], 4);
assert_checkalmostequal ( computed , Jexpected , 1.e-13 );

// 2.5 Compute second numderivative at the same time
[Jcomputed, Hcomputed] = numderivative(myfunction2, x);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );
// 2.6 Test order 1
[Jcomputed , Hcomputed] = numderivative(myfunction2, x, [], 1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-8 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-5 );
// 2.7 Test order 2
[Jcomputed, Hcomputed] = numderivative(myfunction2, x, [], 2);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );
// 2.8 Test order 4
[Jcomputed, Hcomputed] = numderivative(myfunction2, x, [], 4);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-13 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-10, 1.e-10 );
//
// 2.9 Configure the step - Expansion of scalar h to the same size as x
[Jcomputed, Hcomputed] = numderivative(myfunction2, x, 1.e-1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-13 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-10, 1.e-10 );
// 2.10 Configure the step - Expansion of scalar h to the same size as x
h = %eps^(1/3)*abs(x);
[Jcomputed, Hcomputed] = numderivative(myfunction2, x, h);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-8 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-5 , 1.e-5);

// 3. Test H_form
// 3.1 Test H_form = "default"
Jexpected = [4.0 2.0];
Hexpected = [2.0 1.0 1.0 0.0];
[Jcomputed, Hcomputed] = numderivative(myfunction2, x, [], [], "default");
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );
// 3.2 Test H_form = "hypermat"
Jexpected = [4.0 2.0];
Hexpected = [2.0 1.0
1.0 0.0];
[Jcomputed, Hcomputed] = numderivative(myfunction2, x , [], [], "hypermat");
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );
// 3.3 Test H_form = "blockmat"
Jexpected = [4.0 2.0];
Hexpected = [2.0 1.0
1.0 0.0];
[Jcomputed, Hcomputed] = numderivative(myfunction2, x, [], [], "blockmat");
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , %eps );

// 5. Test h parameter
// Test a case where the default step h is very small ~ 1.e-9,
// but, because the function is very flat in the neighbourhood of the
// point, a larger step ~ 1.e-4 reduces the error.
// This means that this test cannot pass if the right step is
// not taken into account, therefore testing the feature "h is used correctly".
myn = 1.e5;
function y = myfunction3 (x)
    y = x^(2/myn);
endfunction
x = 1.0;
h = 6.055454e-006;
Jexpected = (2/myn) * x^(2/myn-1);
Hexpected = (2/myn) * (2/myn-1) * x^(2/myn-2);
[Jcomputed, Hcomputed] = numderivative(myfunction3, x, 1.e-4, 1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-4 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-3 );

// 6. Test Q parameter
function y = myfunction4 (x)
    y = x(1)*x(1) + x(2)+ x(1)*x(2);
endfunction
x = [1.; 2.];
Jexpected = [4. 2.];
Hexpected = [2. 1. 1. 0.];
//
rand("seed", 0);
Q = qr(rand(2, 2));
[Jcomputed, Hcomputed] = numderivative(myfunction4, x, [], [], [], Q);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-8, 1.e-7 );
//
// 7. Test vector output y
function y = myexample(x)
    f1 = sin(x(1)*x(2)) + exp(x(2)*x(3)+x(1));
    f2 = sum(x.^3);
    y = [f1; f2];
endfunction
// The exact gradient
function [g1, g2] = exactg(x)
    g1(1) = cos(x(1)*x(2))*x(2) + exp(x(2)*x(3)+x(1));
    g1(2) = cos(x(1)*x(2))*x(1) + exp(x(2)*x(3)+x(1))*x(3);
    g1(3) = exp(x(2)*x(3)+x(1))*x(2);
    g2(1) = 3*x(1)^2;
    g2(2) = 3*x(2)^2;
    g2(3) = 3*x(3)^2;
endfunction
// The exact Hessian
function [H1, H2] = exactH(x)
    H1(1, 1) = -sin(x(1)*x(2))*x(2)^2 + exp(x(2)*x(3)+x(1));
    H1(1, 2) = cos(x(1)*x(2)) - sin(x(1)*x(2))*x(2)*x(1) + exp(x(2)*x(3)+x(1))*x(3);
    H1(1, 3) = exp(x(2)*x(3)+x(1))*x(2);
    H1(2, 1) = H1(1, 2);
    H1(2, 2) = -sin(x(1)*x(2))*x(1)^2 + exp(x(2)*x(3)+x(1))*x(3)^2;
    H1(2, 3) = exp(x(2)*x(3)+x(1)) + exp(x(2)*x(3)+x(1))*x(3)*x(2);
    H1(3, 1) = H1(1, 3);
    H1(3, 2) = H1(2, 3);
    H1(3, 3) = exp(x(2)*x(3)+x(1))*x(2)^2;
    //
    H2(1, 1) = 6*x(1);
    H2(1, 2) = 0;
    H2(1, 3) = 0;
    H2(2, 1) = H2(1, 2);
    H2(2, 2) = 6*x(2);
    H2(2, 3) = 0;
    H2(3, 1) = H2(1, 3);
    H2(3, 2) = H2(2, 3);
    H2(3, 3) = 6*x(3);
endfunction

x=[1; 2; 3];
[g1, g2] = exactg(x);
[H1, H2] = exactH(x);
Jexpected = [g1'; g2'];
Hexpected = [H1(:)'; H2(:)'];
// 7.1.1 Check Jacobian with default options
Jcomputed = numderivative(myexample, x);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 );
// 7.1.2 Check Jacobian with order = 1
Jcomputed = numderivative(myexample, x, [], 1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-7 );
// 7.1.3 Check Jacobian with order = 2
Jcomputed = numderivative(myexample, x, [], 2);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 );
// 7.1.4 Check Jacobian with order = 4
Jcomputed = numderivative(myexample, x, [], 4);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
// 7.2.1 Check Jacobian and Hessian with default options
[Jcomputed, Hcomputed] = numderivative(myexample, x);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-6 );
// 7.2.2 Check Jacobian and Hessian with order = 1
[Jcomputed, Hcomputed] = numderivative(myexample, x, [], 1);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-7 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-4 );
// 7.2.3 Check Jacobian and Hessian with order = 2
[Jcomputed, Hcomputed] = numderivative(myexample, x, [], 2);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-6 );
// 7.2.3 Check Jacobian and Hessian with order = 4
[Jcomputed, Hcomputed] = numderivative(myexample, x, [], 4);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-10 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-4 , 1e-9);
//
// 7.3 Test with "blockmat"
Jexpected = [g1'; g2'];
Hexpected = [H1; H2];
[Jcomputed, Hcomputed] = numderivative(myexample, x, [], [], "blockmat");
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 );
assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-6 );
//
// 7.4 Test with "hypermat"
Jexpected = [g1'; g2'];
Hexpected = [];
Hexpected(:, :, 1) = H1;
Hexpected(:, :, 2) = H2;
[Jcomputed, Hcomputed] = numderivative(myexample, x, [], [], "hypermat");
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 );
assert_checkequal ( size(Hcomputed) , [3 3 2] );
// This is a limitation of assert (https://gitlab.com/scilab/scilab/-/issues/9461)
// assert_checkalmostequal ( Hcomputed , Hexpected , 1.e-6 );
assert_checkalmostequal ( Hexpected(:, :, 1) , Hexpected(:, :, 1) , 1.e-6);
assert_checkalmostequal ( Hexpected(:, :, 2) , Hexpected(:, :, 2) , 1.e-6);
//
// 8. Check the number of function evaluations
function y = myFevalFun(x)
    global FEVAL
    FEVAL = FEVAL + 1;
    y = sum(x.^3);
endfunction
n = 3;
x = ones(n, 1);
//
// 8.1 Jacobian with various orders
global FEVAL;
FEVAL = 0;
g = numderivative(myFevalFun, x, [], 1);
assert_checkequal ( FEVAL, n+1 );
//
FEVAL = 0;
g = numderivative(myFevalFun, x, [], 2);
assert_checkequal ( FEVAL, 2*n );
//
FEVAL = 0;
g = numderivative(myFevalFun, x, [], 4);
assert_checkequal ( FEVAL, 4*n );
//
// 8.2 Hessian with various orders
FEVAL = 0;
[g, H] = numderivative(myFevalFun, x, [], 1);
assert_checkequal ( FEVAL, (n+1)^2+n+1 );
//
FEVAL = 0;
[g, H] = numderivative(myFevalFun, x, [], 2);
assert_checkequal ( FEVAL, 4*n^2+2*n );
//
FEVAL = 0;
[g, H] = numderivative(myFevalFun, x, [], 4);
assert_checkequal ( FEVAL, 16*n^2+4*n );

//
// 9. Check error messages.
//
// 9.1 Cannot evaluate the function - Function case
//
x = [1.; 2.];
Q = qr(rand(2, 2));
instr = "J = numderivative(myexample, x, [], [], [], Q)";
lclmsg = "%s: Error while evaluating the function: ""%s""\n";
assert_checkerror (instr, lclmsg, [], "numderivative", msprintf(_("Invalid index.\n")));
// 9.2 Cannot evaluate the function - List case
function y = myfunction6 (x, p1, p2)
    y = p1*x*x + p2;
endfunction
x = [1.; 2.];
Q = qr(rand(2, 2));
funf = list(myfunction6, 7., 8.);
instr = "J = numderivative(funf, x, [], [], [], Q)";
lclmsg = "%s: Error while evaluating the function: ""%s""\n";
assert_checkerror (instr, lclmsg, [], "numderivative", msprintf(_("Operator %ls: Wrong dimensions for operation [%ls] %ls [%ls].\n"), "*", "2x1", "*", "2x1"));
// 9.3 Various error cases
x = 2;
// Correct syntax: [J, H] = numderivative(myfunction, x)
// Number of input arguments
instr = "J = numderivative()";
lclmsg = "%s: Wrong number of input arguments: %d to %d expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 2, 6 );
// Wrong type of f
myfunction7 = "myfunction";
instr = "[J, H] = numderivative(myfunction7, x)";
lclmsg = "%s: Wrong type for argument #%d: Function or list expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 1 );
// Wrong type of x
xx = "";
instr = "[J, H] = numderivative(myfunction, xx)";
lclmsg = "%s: Wrong type for argument #%d: Matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 2 );
// Wrong type of h
hh = "";
instr = "[J, H] = numderivative(myfunction, x, hh)";
lclmsg = "%s: Wrong type for argument #%d: Matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 3 );
// Wrong type of order
oo = "";
instr = "[J, H] = numderivative(myfunction, x, [], oo)";
lclmsg = "%s: Wrong type for argument #%d: Matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 4 );
// Wrong type of H_form
HHform = 12;
instr = "[J, H] = numderivative(myfunction, x, [], [], HHform)";
lclmsg = "%s: Wrong type for input argument #%d: String array expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 5 );
// Wrong type of Q
Q = "";
instr = "[J, H] = numderivative(myfunction, x, [], [], [], Q)";
lclmsg = "%s: Wrong type for argument #%d: Matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 6 );
// Wrong size of f (list case)
myfunl = list(myfunction);
instr = "[J, H] = numderivative(myfunl, x)";
lclmsg = "%s: Wrong number of elements in input argument #%d: At least %d elements expected, but current number is %d.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 1, 2, 1 );
// Wrong size of x
x = [1. 2.; 3. 4.];
xx = x';
instr = "[J, H] = numderivative(myfunction2, xx)";
lclmsg = "%s: Wrong size for input argument #%d: Vector expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 2 );
// Wrong size of h
x = [1.0; 2.0];
h = [1; 2; 3];
instr = "[J, H] = numderivative(myfunction2, x, h)";
lclmsg = "%s: Incompatible input arguments #%d and #%d: Same sizes expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 3, 1);
// Wrong size of order
x = [1.0; 2.0];
order = [1; 2; 4];
instr = "[J, H] = numderivative(myfunction2, x, [], order)";
lclmsg = "%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 4, 1, 1);
// Wrong size of H_form
x = [1.0; 2.0];
H_form = ["blockmat" "hypermat"];
instr = "[J, H] = numderivative(myfunction2, x, [], [], H_form)";
lclmsg = "%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 5, 1, 1);
// Wrong size of Q
x = [1.0; 2.0];
Q = ones(2, 3);
instr = "[J, H] = numderivative(myfunction2, x, [], [], [], Q)";
lclmsg = "%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n";
assert_checkerror (instr, lclmsg, [], "numderivative", 6, 2, 2);

// 10. Check that a nonzero step is used for components of x which are zero.
// Check also that a scaled step is used.
x=[0; 0; 1.e-50];
[g1, g2] = exactg(x);
[H1, H2] = exactH(x);
Jexpected = [g1'; g2'];
Hexpected = [H1(:)'; H2(:)'];
// 10.1 Check Jacobian and Hessian with default options
Jcomputed = numderivative(myexample, x);
assert_checkalmostequal ( Jcomputed , Jexpected , 1.e-9 , 1.e-10);
// For the Jacobian, the step used is h = [%eps^(1/3); %eps^(1/3); %eps^(1/3)*1.e50]

// 11. Prove the numerical superiority of numderivative.
// Although the step provided by numderivative is not always
// optimal, it is often sufficiently accurate.
// Print the number of significant digits.
// x = 1.00D-100, numdiff = 0, derivative = 0,  numderivative = 11
// x = 1.000D-32, numdiff = 0, derivative = 0,  numderivative = 10
// x = 1.000D+32, numdiff = 5, derivative = 0,  numderivative = 11
// x = 1.00D+100, numdiff = 5, derivative = 0,  numderivative = 10
// x = 1,         numdiff = 7, derivative = 11, numderivative = 11

function y = myfunction10 (x)
    y = x^3;
endfunction
function y = g10 (x)
    y = 3*x^2;
endfunction
for x = [10^-100 10^-32 10^32 10^100 1]
    exact = g10 (x);
    g3 = numderivative(myfunction10, x);
    d3 = assert_computedigits ( g3, exact );
    assert_checktrue ( d3 > 9 );
end

// 12. Check that numderivative also accepts row vector x
function f = myfunction11(x)
    f = x(1)*x(1) + x(1)*x(2);
endfunction
// 12.1 Check with row x
x = [5 8];
g = numderivative(myfunction11, x);
exact = [18 5];
assert_checkalmostequal ( g , exact , 1.e-9 );
// 12.2 Check with h
h = sqrt(%eps)*(1+1d-3*abs(x));
g = numderivative(myfunction11, x, h);
assert_checkalmostequal ( g , exact , 1.e-8 );

// 13. Check that we can derivate a compiled function
x = 1;
g = numderivative (sqrt, x);
assert_checkalmostequal ( g , 0.5 , 1.e-8 );

// 14.1 Check that numderivative works when f takes extra arguments
function y = f(x, A, p, w)
    y = x'*A*x + p'*x + w;
endfunction
// with Jacobian and Hessian given
// by J(x) = x'*(A+A')+p' and H(x) = A+A'.
A = rand(3, 3);
p = rand(3, 1);
w = 1;
x = rand(3, 1);
h = 1;
[J, H] = numderivative(list(f, A, p, w), x, h, [], "blockmat");
assert_checkalmostequal( J , x'*(A+A')+p' );
assert_checkalmostequal( H , A+A' );
// 14.2 Same test with a different function
function y = G(x, p)
    f1 = sin(x(1)*x(2)*p) + exp(x(2)*x(3)+x(1));
    f2 = sum(x.^3);
    y = [f1; f2];
endfunction
x = rand(3, 1);
p = 1;
df1_dx1 = cos(x(1)*x(2)*p)*x(2)*p+exp(x(2)*x(3)+x(1));
df1_dx2 = cos(x(1)*x(2)*p)*x(1)*p+exp(x(2)*x(3)+x(1))*x(3);
df1_dx3 = exp(x(2)*x(3)+x(1))*x(2);
df2_dx1 = 3*x(1)^2;
df2_dx2 = 3*x(2)^2;
df2_dx3 = 3*x(3)^2;
expectedJ = [df1_dx1   df1_dx2   df1_dx3;
df2_dx1   df2_dx2  df2_dx3 ];
df1_dx11 = -sin(x(1)*x(2)*p)*x(2)^2*p^2+exp(x(2)*x(3)+x(1));
df1_dx12 = -sin(x(1)*x(2)*p)*x(1)*x(2)*p^2+cos(x(1)*x(2)*p)*p+exp(x(2)*x(3)+x(1))*x(3);
df1_dx13 = exp(x(2)*x(3)+x(1))*x(2);
df1_dx21 = df1_dx12;
df1_dx22 = -sin(x(1)*x(2)*p)*x(1)^2*p^2+exp(x(2)*x(3)+x(1))*x(3)^2;
df1_dx23 = exp(x(2)*x(3)+x(1))*(1+x(3)*x(2));
df1_dx31 = df1_dx13;
df1_dx32 = df1_dx23;
df1_dx33 = exp(x(2)*x(3)+x(1))*x(2)^2;
df2_dx11 = 6*x(1);
df2_dx12 = 0;
df2_dx13 = 0;
df2_dx21 = 0;
df2_dx22 = 6*x(2);
df2_dx23 = 0;
df2_dx31 = 0;
df2_dx32 = 0;
df2_dx33 = 6*x(3);
expectedH = [df1_dx11   df1_dx12   df1_dx13   df1_dx21   df1_dx22   df1_dx23   df1_dx31   df1_dx32   df1_dx33;
df2_dx11   df2_dx12   df2_dx13   df2_dx21   df2_dx22   df2_dx23   df2_dx31   df2_dx32   df2_dx33 ];
[J, H] = numderivative(list(G, p), x);
assert_checkalmostequal( J , expectedJ, [], 1e-8);
assert_checkalmostequal( H , expectedH , [], 1e-5);
