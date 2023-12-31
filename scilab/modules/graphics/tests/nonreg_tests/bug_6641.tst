// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2010 - DIGITEO - Lando Pierre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- INTERACTIVE TEST -->

// <-- Non-regression test for bug 6641 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6641
//
// <-- Short Description -->
// bar3d did not handle correctly optionals arguments.
//
// run this :

bar3d(10*rand(10,10),5,5,"x@u@p",[1,1,4],[-10,10,-10,10,-10,10]);


// legends should be "x", "u" and "p", and the bounding box [-10, 10] ^ 3
