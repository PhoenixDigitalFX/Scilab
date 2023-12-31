// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Sylvestre LEDRU <sylvestre.ledru@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 490 -->
// Please note that it is store under the request feature of Scilab
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/490
//
// <-- Short Description -->
//    Wrong size detection in sparse matrix

toto = spzeros(2^16, 2^16);
toto(1, 8) = toto(1, 8)+5;
toto(1, 8) = toto(1, 8)+5;
assert_checkequal(toto(1, 8), sparse([1,1], 10));

