// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 6521 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6521
//
// <-- Short Description -->
// getmd5 crashed with a wrong second argument.

ierr = execstr('getmd5(""toto"",""strin"")','errcatch');
if ierr <> 999 then pause,end
