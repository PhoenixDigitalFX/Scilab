// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3467 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3467
//
// <-- Short Description -->
// diag takes the first column of a matrix instead of the diagonal.

A = [1 2;3 4];

// Test with variable reference
if or(diag(A)<>[1;4]) then pause;end

// Test with value
if or(diag([1 2;3 4])<>[1;4]) then pause;end
