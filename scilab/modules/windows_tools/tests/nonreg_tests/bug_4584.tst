// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4584 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4584
//
// <-- Short Description -->
// home value is wrong on Windows

if home <> getenv('USERPROFILE',SCI) then pause,end

