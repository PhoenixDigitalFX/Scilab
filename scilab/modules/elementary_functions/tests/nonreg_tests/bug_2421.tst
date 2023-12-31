// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2421 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2421
//
// <-- Short Description -->
//    colon (all elements) assignment from output arguments of a function beyond the
//    first not possible

if execstr('[a(:), v(1)] = (1, 2)','errcatch')<>0 then pause,end
