//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 1649 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1649
//
// <-- Short Description -->
//    asciimat reshapes incorrectly its results
// -->asciimat(z)
//  ans  =
//  
//     49.    53.    50.    54.  
//     51.    55.    52.    56.  
//  
// 
// instead of 
// 
//  ans  =
//  
//     49.    50.    51.    52.  
//     53.    54.    55.    56.
// 

z = ['1' '2' '3' '4'; '5' '6' '7' '8'];

if or(asciimat(z)<>[49 50 51 52 ; 53 54 55 56]) then pause;end

