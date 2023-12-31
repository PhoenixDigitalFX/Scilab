// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7950 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7950
//
// <-- Short Description -->
// spec function crashed on Windows


n = [0,10,0,0,10;
10,0,10,0,0;   
0,10,0,10,0;   
0,0,10,0,10;   
10,0,0,10,0];
d = [1,3,1,1,3;  
3,1,3,1,1;   
1,3,1,3,1;   
1,1,3,1,3;   
3,1,1,3,1];
A = n./d;
r = spec(A);
ref = [  -5.3934466; ..
  -5.3934466; ..
    2.0601133; ..
    2.0601133; ..
    6.6666667];
if norm(r - ref) > 1e9 *%eps then pause, end


 s11 = [ 0.0633728    0.0313074  -0.0021908  -0.0014231  -0.0025785    0.0968961; ..
         0.0313074    0.0177124  -0.0010565  -0.0007932  -0.0012911    0.0410817; ..
        -0.0021908   -0.0010565    0.0001016    0.0000454    0.0000847  -0.0034275; ..
        -0.0014231   -0.0007932    0.0000454    0.0000428    0.0000659  -0.0019033; ..
        -0.0025785   -0.0012911    0.0000847    0.0000659    0.0001176  -0.0038904; ..
         0.0968961    0.0410817  -0.0034275  -0.0019033  -0.0038904    0.1686615];
         
[eigenv, rho] = spec(s11);
if or(size(eigenv) <> [6 6]) then pause, end
if or(size(rho) <> [6 6]) then pause, end