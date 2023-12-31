// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3463 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3463
//
// <-- Short Description -->
//    acosh(%nan) returns 0, it should return %NaN.
// =============================================================================

if ~isnan(acosh(%nan))  then pause, end
if ~isnan(acosh(-%nan)) then pause, end
