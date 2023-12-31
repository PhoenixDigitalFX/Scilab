//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 2670 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2670
//
// <-- Short Description -->
//    getlanguage() returns an empty string (occurs both under Linux and Windows).
//

if length(getlanguage()) <> 5 then pause,end
