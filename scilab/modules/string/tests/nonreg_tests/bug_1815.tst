// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1815 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1815
//
// <-- Short Description -->
//    strindex('aaba','aa') return [1 4] instead of [1]

if strindex('aaba','aa') <> 1 then pause, end
if strindex('aabaaa','aa') <> [1 4 5] then pause, end
