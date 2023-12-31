// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) DIGITEO - 2009 - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4469 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4469
//
// <-- Short Description -->
// If getmd5() or mopen is called with an existing directory as first input agument, scilab hangs with 100% CPU. It should return
// an error.

ierr = execstr('getmd5(TMPDIR)','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('mopen(TMPDIR)','errcatch');
if ierr <> 999 then pause,end
