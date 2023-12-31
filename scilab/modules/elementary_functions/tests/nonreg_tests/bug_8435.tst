// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 8435 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8435
//
// <-- Short Description -->
// squarewave(t) fails for t<0

OK = (squarewave(-1)==-1); 
if ~OK then pause, end
