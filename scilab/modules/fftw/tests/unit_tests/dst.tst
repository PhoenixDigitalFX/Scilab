// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - INRIA - Serge STEER
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// Here only 1d dst computations are checked, because the dst gateway
// is a clone of the dct one.
//real cases
A=[2,8,-1,3,7,6,8,7,9,1,6,7,7,2,5];
n=15;
//DST-I
y_ref=2*sum((A'*ones(1,n)).*sin(%pi*(1:n)'*(1:n)/(n+1)),1);
assert_checkalmostequal(dst(A,-1,"dst1"),y_ref);
assert_checkalmostequal(dst(dst(A,-1,"dst1"),1,"dst1"),2*(n+1)*A);

//DST-II
y_ref=2*sum((A'*ones(1,n)).*sin(%pi*(0.5:n)'*(1:n)/(n)),1);
assert_checkalmostequal(dst(A,-1,"dst2"),y_ref);
assert_checkalmostequal(dst(dst(A,-1,"dst2"),1,"dst3"),2*n*A);

//DST-III
y_ref=((-1).^(0:n-1))*A(n)+ 2*sum((A(1:n-1)'*ones(1,n)).*sin(%pi*(1:n-1)'*(0.5:n)/(n)),1);
assert_checkalmostequal(dst(A,1,"dst3"),y_ref);
assert_checkalmostequal(dst(dst(A,1,"dst3"),-1,"dst2"),2*n*A);


//DST-iV
y_ref=2*sum((A'*ones(1,n)).*sin(%pi*(0.5:n)'*(0.5:n)/(n)),1);
assert_checkalmostequal(dst(A,-1,"dst4"),y_ref);
assert_checkalmostequal(dst(dst(A,-1,"dst4"),1,"dst4"),2*n*A);
//complex cases

A=[2,8,-1,3,7,6,8,7,9,1,6,7,7,2,5]+%i*[2 2 2 9 7 3 9 2 3 4 3 6 5 3 6];
n=15;
//DST-I
y_ref=2*sum((A.'*ones(1,n)).*sin(%pi*(1:n)'*(1:n)/(n+1)),1);
assert_checkalmostequal(dst(A,-1,"dst1"),y_ref);
assert_checkalmostequal(dst(dst(A,-1,"dst1"),1,"dst1"),2*(n+1)*A);

//DST-II
y_ref=2*sum((A.'*ones(1,n)).*sin(%pi*(0.5:n)'*(1:n)/(n)),1);
assert_checkalmostequal(dst(A,-1,"dst2"),y_ref);
assert_checkalmostequal(dst(dst(A,-1,"dst2"),1,"dst3"),2*n*A);

//DST-III
y_ref=((-1).^(0:n-1))*A(n)+ 2*sum((A(1:n-1).'*ones(1,n)).*sin(%pi*(1:n-1)'*(0.5:n)/(n)),1);
assert_checkalmostequal(dst(A,1,"dst3"),y_ref,100*%eps,104*%eps);
assert_checkalmostequal(dst(dst(A,1,"dst3"),-1,"dst2"),2*n*A);


//DST-iV
y_ref=2*sum((A.'*ones(1,n)).*sin(%pi*(0.5:n)'*(0.5:n)/(n)),1);
assert_checkalmostequal(dst(A,-1,"dst4"),y_ref);
assert_checkalmostequal(dst(dst(A,-1,"dst4"),1,"dst4"),2*n*A);
//complex cases

