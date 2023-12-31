// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 9963 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9963
//
// <-- Short Description -->
// The assert_computedigits function is not vectorized.

function flag = MY_assert_equal ( computed , expected )
  if computed==expected then
    flag = 1;
  else
    flag = 0;
  end
  if flag <> 1 then pause,end
endfunction

// Test performance of computedigits: check that vectorization is used.
// This test must pass within a second.
A = rand(100,100);
B = rand(100,100);
D = assert_computedigits(A,B);
MY_assert_equal ( size(D) , [100 100] );
