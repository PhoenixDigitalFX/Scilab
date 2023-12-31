// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre .marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2675 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2675
//
// <-- Short Description -->
// grep(["hat";"cat"],'/[hc]+at/','r') hangs scilab with 100% cpu load
//

if grep(["hat";"cat"],"/[hc]+at/","r") <> [1 2] then pause,end
