// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 10611 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10611
//
// <-- Short Description -->
// poly() function gave different results on 64 and 32-bit Scilab on Windows.
//


bPoles = [-0.3826834+%i*0.9238795
-0.9238795+%i*0.3826834
-0.9238795-%i*0.3826834
-0.3826834-%i*0.9238795];

sPoly = poly(bPoles, 's', 'roots');

sRoots = roots(sPoly);

sRoot_REF = [-0.3826834+0.9238795*%i; ..
-0.3826834-0.9238795*%i; ..
-0.9238795+0.3826834*%i; ..
-0.9238795-0.3826834*%i];

assert_checkalmostequal(sRoots, sRoot_REF);

