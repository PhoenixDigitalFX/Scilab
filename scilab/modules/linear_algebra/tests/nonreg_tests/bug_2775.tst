// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
// Copyright (C) 2009 - INRIA - Michael Baudin, Antoine Elias
// Copyright (C) 2010-2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- Non-regression test for bug 2775 -->
//
// <-- CLI SHELL MODE -->
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2775
//



// Bibliography :
// "IEEE Standard for Floating-Point Arithmetic"
// IEEE Std 754-2008
// 29 August 2008
// (Revision of IEEE Std 754-1985)

res_1 = 0.0 * %nan;
res_2 = %nan * 0.0;

assert_checkequal ( res_1 , %nan );
assert_checkequal ( res_2 , %nan );


