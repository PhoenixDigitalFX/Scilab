//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 570 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/570
//
// <-- Short Description -->
//    missing overload for string hypermatrix insertion?
//    See bug 566


if execstr('a(2,3,2)=''x''','errcatch') <> 0 then pause,end
