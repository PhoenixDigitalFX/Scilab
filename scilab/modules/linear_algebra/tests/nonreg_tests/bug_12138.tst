// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 12138 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12138
//
// <-- Short Description -->
//    eigs(A,B) returns incorrect eigenvectors for dense matrices
// =============================================================================

//non symmetric case
A = rand(10,10);
[d v] = eigs(A);
assert_checkalmostequal(norm(A*v-v*d),0,[], 1D-8);
[d v] = eigs(A,[],8,'SM');
assert_checkalmostequal(norm(A*v-v*d),0,[], 1D-8);
[d v] = eigs(A,[],8,1);
assert_checkalmostequal(norm(A*v-v*d),0,[], 1D-8);
[d v] = eigs(A,[],8,%i);
assert_checkalmostequal(norm(A*v-v*d),0,[], 1D-8);

//symmetric case
A=rand(10,10);
A = A*A';
[d v] = eigs(A);
assert_checkalmostequal(norm(A*v-v*d),0,[], 1D-8);

//general eigenvalue problem
B = rand(10,10);
B = B*B';
A = rand(10,10);
[d v] = eigs(A,B);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A,B,8,'SM');
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A,B,8, 1);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A,B, 8, %i);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);

opts.cholB = %t;
R = chol(B);
[d v] = eigs(A, R, 8, 'LM', opts);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A, R, 8,'SM', opts);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A, R, 8, 1, opts);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A, R, 8, %i, opts);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);

A=A*A';
[d v] = eigs(A,B);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A,B,8,'SM');
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A,B,8,1);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);
[d v] = eigs(A,B,8,%i);
assert_checkalmostequal(norm(A*v-B*v*d),0,[],1D-8);


//complex case
A1 = rand(10,10);
A2 = rand(10,10);
B1 = rand(10,10);
B2 = rand(10,10);
C1 = A1+%i*A2;
[d v] = eigs(C1);
assert_checkalmostequal(norm(C1*v-v*d),0,[],1D-8);
[d v] = eigs(C1,[], 8,'SM');
assert_checkalmostequal(norm(C1*v-v*d),0,[],1D-8);
[d v] = eigs(C1, [],8, 1+%i);
assert_checkalmostequal(norm(C1*v-v*d),0,[],1D-8);
C2 = B1+%i*B2;
C2=C2*C2';
[d v] = eigs(C1, C2);
assert_checkalmostequal(norm(C1*v-C2*v*d),0,[],1D-8);
[d v] = eigs(C1, C2, 8, 'SM');
assert_checkalmostequal(norm(C1*v-C2*v*d),0,[],1D-8);
[d v] = eigs(C1, C2, 8, %i);
assert_checkalmostequal(norm(C1*v-C2*v*d),0,[],1D-8);
