// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Pierre Lando
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 7024 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7024
//
// <-- Short Description -->
// Error messages from twinkle was not standard.

ierr = execstr("twinkle(1, 6)", "errcatch");
if lasterror() <> msprintf(gettext("%s: Wrong type for input argument #%d: Graphic handle expected.\n"), "twinkle", 1) then pause, end

ierr = execstr("twinkle(gcf(), ""a string"")", "errcatch");
if lasterror() <> msprintf(gettext("%s: Wrong type for input argument #%d: Positive integer expected.\n"), "twinkle", 2) then pause, end
