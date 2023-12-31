//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3296 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3296
//
// <-- Short Description -->
// Wrong error message in exists

execstr("exists(4)", "errcatch");

msg = lasterror();

if msg<> msprintf(gettext("%s: Wrong type for argument #%d: Matrix of strings expected.\n"), "exists", 1) then pause; end
