// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2018 - ESI Group - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 12659 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12659
//
// Crash on big modulo

tab =  1:5000000;
tab = modulo(5000000,tab);
