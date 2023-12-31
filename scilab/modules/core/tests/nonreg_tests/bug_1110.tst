//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 1110 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1110
//
// <-- Short Description -->
//    parser or evaluator error


// allowed since Scilab 6
L =list(4,5,[1 2]);
if execstr("z=L(3)(:)(1)","errcatch")<>0 then pause,end

L=list(4,5,[1 1/%s]);
if execstr("z=L(3)(1,:)(2)","errcatch")<>0 | or(z<>[1 1]) then pause,end
