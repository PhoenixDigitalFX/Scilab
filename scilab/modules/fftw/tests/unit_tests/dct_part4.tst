// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - INRIA - Serge STEER
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// Here only option specific cases are checked because the other parts
// are common with dct_part[1 2 3].tst
//============================================================================================
//=================================dct(A, ..., option) ============================================
//==============================================================================================
//DCT-II, DCT, IDCT, DCT-III
A=[2,8,-1,3,7,6,8,7,9,1,6,7,7,2,5];
n=15;
assert_checkequal(dct(A),dct(A,"dct"));
assert_checkequal(dct(A,1),dct(A,1,"idct"));

assert_checkalmostequal(dct(A)./dct(A,"dct2"),[0.5 ones(1,n-1)/sqrt(2)]/sqrt(n));//unnormalized

A=matrix([1 5 -3 7 0.3 -1 23 -0.5 -0.9 2 -7 23],3,4);
assert_checkequal(dct(A),dct(A,"dct"));
assert_checkequal(dct(A,1),dct(A,1,"idct"));

[m,n]=size(A);
y_ref=diag([0.5 ones(1,m-1)/sqrt(2)]/sqrt(m))*dct(A,"dct2")*diag([0.5 ones(1,n-1)/sqrt(2)]/sqrt(n));
assert_checkalmostequal(dct(A),y_ref);

//dct-I
A=[2,8,-1,3,7,6,8,7,9,1,6,7,7,2,5];n=15;
y_ref=A(1)+(-1).^(0:n-1)*A(n)+2*sum((A(2:n-1)'*ones(1,n)).*cos(%pi*(1:n-2)'*(0:n-1)/(n-1)),1);
assert_checkalmostequal(dct(A,"dct1"),y_ref);


//dct-IV
A=[2,8,-1,3,7,6,8,7,9,1,6,7,7,2,5];n=15;
y_ref=2*sum((A'*ones(1,n)).*cos(%pi*(0.5:n)'*(0.5:n)/n),1);
assert_checkalmostequal(dct(A,-1,"dct4"),y_ref);
assert_checkalmostequal(dct(dct(A,-1,"dct4"),1,"dct4"),2*n*A);
