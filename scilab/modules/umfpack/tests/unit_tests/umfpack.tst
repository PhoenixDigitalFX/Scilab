// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - Bruno PINCON
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

assert_checkfalse(execstr("umfpack()"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong number of input argument(s): %d expected.\n"), "umfpack", 3);
assert_checkerror("umfpack()", refMsg);

assert_checkfalse(execstr("umfpack(speye(3,3), 2, 2)"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: string expected.\n"), "umfpack", 2);
assert_checkerror("umfpack(speye(3,3), 2, 2)", refMsg);

assert_checkfalse(execstr("umfpack(1, ""\"", 2)"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A sparse matrix expected.\n"), "umfpack", 1);
assert_checkerror("umfpack(1, ""\"", 2)", refMsg);

assert_checkfalse(execstr("umfpack(speye(3,3), ""\"", %s)"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A matrix expected.\n"), "umfpack", 3);
assert_checkerror("umfpack(speye(3,3), ""\"", %s)", refMsg);

A = sparse( [ 2  3  0  0  0;
3  0  4  0  6;
0 -1 -3  2  0;
0  0  1  0  0;
0  4  2  0  1] );
b = [8 ; 45; -3; 3; 19];
x = umfpack(A,"\",b);

assert_checkalmostequal(x, [1 2 3 4 5]');

// test the other form x A = b
b = [8  20  13  6  17];
x = umfpack(b,"/",A);   // solution must be [1 2 3 4 5]

assert_checkalmostequal(x, [1 2 3 4 5]);

// test multiple rhs
b = rand(5,3);
x = umfpack(A,"\",b);

assert_checkfalse(norm(A*x-b) < %eps);

// test multiple rhs for x A = b
b = rand(3,5);
x = umfpack(b,"/",A);
assert_checkfalse(norm(x*A - b) > %eps);

// solve a complex system
A = sparse( [ 2+%i  3+2*%i  0      0    0;
3-%i  0       4+%i   0    6-3*%i;
0    -1+%i   -3+6*%i 2-%i 0;
0     0       1-5*%i 0    0;
0     4       2-%i   0    1] );
b = [ 3+13*%i ; 58+32*%i ; -19+13*%i ; 18-12*%i ; 22+16*%i ];
x = umfpack(A,"\",b);  // x must be [1+i; 2+2i; 3+3i; 4 + 4i; 5+5i]

assert_checkfalse(norm(x - [1+%i; 2+2*%i; 3+3*%i; 4 + 4*%i; 5+5*%i]) < %eps);

A = sparse( [ 2  3  0  0  0;
3  0  4  0  6;
0 -1 -3  2  0;
0  0  1  0  0;
0  4  2  0  1] );
Lup = umf_lufact(A);
[OK, nrow, ncol, lnz, unz, udiag_nz, it] = umf_luinfo(Lup);  // OK must be %t, nrow=ncol = 5,
[L,U,p,q,R] = umf_luget(Lup);
assert_checkequal(nnz(L), lnz);
assert_checkequal(nnz(U), unz);

umf_ludel(Lup); // clear memory



// this is the test matrix from UMFPACK
A = sparse( [ 2  3  0  0  0;
3  0  4  0  6;
0 -1 -3  2  0;
0  0  1  0  0;
0  4  2  0  1] );
Lup = umf_lufact(A);
[L,U,p,q,R] = umf_luget(Lup);
B = A;
for i=1:5, B(i,:) = B(i,:)/R(i); end // apply the row scaling
// must be a (quasi) nul matrix
assert_checkfalse(norm(B(p,q) - L*U) > %eps);
umf_ludel(Lup);// clear memory


// the same with a complex matrix
A = sparse( [ 2+%i  3+2*%i  0      0    0;
3-%i  0       4+%i   0    6-3*%i;
0    -1+%i   -3+6*%i 2-%i 0;
0     0       1-5*%i 0    0;
0     4       2-%i   0    1] );
Lup = umf_lufact(A);
[L,U,p,q,R] = umf_luget(Lup);
B = A;
for i=1:5, B(i,:) = B(i,:)/R(i); end // apply the row scaling
// must be a (quasi) nul matrix
assert_checkfalse(norm(B(p,q) - L*U) > %eps);

umf_ludel(Lup); // clear memory
