// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7485 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7485
//
// <-- Short Description -->
// Division of matrices of complex numbers crashed on Windows.

L1 = [-22.168 + 14.267*%i  -10.428 + 17.817*%i  -2.8879 + 14.947*%i    0.4547 + 11.203*%i];
T = [8.9186 - 3.0399*%i    6.8345 - 4.7536*%i    4.8415 - 5.2106*%i    3.3626 - 5.0337*%i; ..
79.459 - 58.111*%i    30.562 - 70.097*%i    0.8502 - 55.647*%i  -10.784 - 38.795*%i];
if execstr("a = -real(L1/T);", "errcatch") <> 0 then pause, end

A = [1 ,  1, %i];
B = [1 ,  1,  1];
if execstr("r = A / B;", "errcatch") <> 0 then pause, end

r = [1 ,  1, %i]/[1 ,  1,  1];
ref = 0.6666667 + 0.3333333 * %i;

if abs(r - ref) > %eps * 1e9 then pause, end


