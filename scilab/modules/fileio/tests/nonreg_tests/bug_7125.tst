// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7125 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7125
//
// <-- Short Description -->
// fscanfMat() did not read correctly %inf ,-%inf and %nan values respectively 
// recorded by fprintfMat() 
//
//==============================================================================
M = [1 , %nan , 3; -%inf, 2, %inf];
fprintfMat(TMPDIR + '/bug_7125_1.mat', M);
r = fscanfMat(TMPDIR + '/bug_7125_1.mat');
if ~and(size(r) == [2 3]) then pause, end
ref_cmp = [%T %F %T; %T %T %T];
if ~and((r == M) == ref_cmp) then pause, end
//==============================================================================
[r, t] = fscanfMat(TMPDIR + '/bug_7125_1.mat');
if ~and(size(r) == [2 3]) then pause, end
ref_cmp = [%T %F %T; %T %T %T];
if ~and((r == M) == ref_cmp) then pause, end
if t <> '' then pause, end
//==============================================================================
text = ['text'; 'from'; 'scilab Mat file'];
M = [1 , %nan , 3; -%inf, 2, %inf];
fprintfMat(TMPDIR + '/bug_7125_2.mat', M, "%f", text);
[r, t] = fscanfMat(TMPDIR + '/bug_7125_2.mat');
if ~and(t == text) then pause, end
//==============================================================================
M = eye(50,50);
fprintfMat(TMPDIR + '/bug_7125_3.mat', M);
r = fscanfMat(TMPDIR + '/bug_7125_3.mat');
if ~and(size(r) == [50 50]) then pause, end
if ~and(r == M) then pause, end
//==============================================================================
