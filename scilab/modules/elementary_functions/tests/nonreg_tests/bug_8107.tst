// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 8107 and 8136 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8107
// https://gitlab.com/scilab/scilab/-/issues/8136
//
// <-- Short Description -->
// sum(a,1) or cumsum(a,1) may  make Scilab 5.0.3-beta-4 crash in  particular context.

a=[diag([%i,2,3]),[0;0;0]]';
if or(sum(abs(a),1)<>(1:3)) then pause,end
