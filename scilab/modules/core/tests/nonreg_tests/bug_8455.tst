// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 2013 - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 8455 -->
//
// <-- CLI SHELL MODE -->
// <-- INTERACTIVE TEST -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8455
//
// <-- Short Description -->
// The format function misbehave on infinity.

format("e",25);
%inf
// the "D+" must not be displayed.
