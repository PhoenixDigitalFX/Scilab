// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - INRIA - Serge STEER
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

//=================================fft(A ,isn, dim, incr [,flag]) =============================
A=[0   1   1
   2  -1  -1
   3   4   4
   5   1  -1];
y=matrix(fft(A(:),-1,4,1),size(A));
assert_checkalmostequal(y,fft(A,-1,1));
y1=matrix(fft(y(:),1,4,1),size(A));
assert_checkalmostequal(y1,fft(y,1,1));

y=matrix(fft(A(:),-1,3,4),size(A));
assert_checkalmostequal(y,fft(A,-1,2));
y1=matrix(fft(y(:),1,3,4),size(A));
assert_checkalmostequal(y1,fft(y,1,2));

Dims=[5 4 9 5 6];
A=rand(1,prod(Dims));
y=matrix(fft(A,-1,20,1),[5*4 9 5 6]);
assert_checkalmostequal(y,fft(matrix(A,[5*4 9 5 6]),-1,1));

y=matrix(fft(A,-1,45,20),[5*4 9*5 6]);
assert_checkalmostequal(y,fft(matrix(A,[5*4 9*5 6]),-1,2));
y1=matrix(fft(y(:),1,45,20),size(A));
assert_checktrue(isreal(y1));
assert_checkalmostequal(y1,A);

Dims=[5 4 9 5 6];
A=rand(1,prod(Dims));
y=matrix(fft(A(:),-1,[9 5],[20 180]),[5 4 9 5 6]);
y1=fft(matrix(A,[5 4 9 5 6]),-1,[3 4]);
assert_checkalmostequal(y,y1);

y1=fft(y(:),1,[9 5],[20 180]);
assert_checkalmostequal(A(:),y1);
assert_checktrue(isreal(y1));


Dims=[5 4 9 5 6];
A=rand(1,prod(Dims));
y1=fft(matrix(A,[5 4 9 5 6]),-1,[2 4]);

y=matrix(fft(A(:),-1,[4 5],[5 180]),[5 4 9 5 6]);

assert_checkalmostequal(y,y1);

y1=fft(y(:),1,[4 5],[5 180]);
assert_checkalmostequal(A(:),y1);
assert_checktrue(isreal(y1));
