// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3886 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3886
//
// Short description:
// strsubst with regular expression was working only on the first element of the vector.
//==============================================================
names = ['foo.sci';'toto.sci';'titi.sci'];  
names=strsubst(names, "/\.sci$/",'','r');
if names <> ['foo';'toto';'titi'] then, pause, end
