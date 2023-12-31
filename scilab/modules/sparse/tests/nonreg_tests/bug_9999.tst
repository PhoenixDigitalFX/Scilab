// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9999 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9999
//
// <-- Short Description -->
// The sparse() and ^ operators mix could fail.

A=[1 2 ; 3 4];
res = sparse(A)^0 == sparse(A^0);

assert_checkequal(res, sparse([%t %t ; %t %t]));
