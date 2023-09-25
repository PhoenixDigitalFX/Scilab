// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2677 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2677


if grep(["at";"cat"],'/[hc]+at/','r')	 <>  2 then pause,end
if grep(["cat";"at"],'/[hc]+at/','r')	 <>  1 then pause,end



