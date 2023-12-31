// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre .marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2788 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2788
//
// <-- Short Description -->
// strsubst() function return weird strings. (only under Linux)

if strsubst("abc","/ab*c/"," ","r") <> " " then pause,end
