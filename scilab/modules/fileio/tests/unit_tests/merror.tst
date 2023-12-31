//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

mclearerr();
[a,b] = merror();

if a <> 0 then pause,end
wm = warning('query');
warning('off');
ierr = execstr('mclose(999);','errcatch');
ierr = execstr('[a,b] = merror(999);','errcatch');
warning(wm);
if ierr <> 999 then pause,end

ierr = execstr('merror([1 1])','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('merror([1 1])','errcatch');
if ierr <> 999 then pause,end