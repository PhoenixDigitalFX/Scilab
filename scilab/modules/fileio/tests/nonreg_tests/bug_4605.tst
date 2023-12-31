// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) DIGITEO - 2009 - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4605 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4605
//
// <-- Short Description -->
//  basename('') returns a error and not ''

ierr = execstr('basename('''');','errcatch');
if ierr <> 0 then pause,end

r = basename('');
if r <> '' then pause,end

r = basename('',%f,%f);
if r <> '' then pause,end

r = basename('',%t,%f);
if r <> '' then pause,end

r = basename('',%t,%t);
if r <> '' then pause,end

r = basename('',%f,%t);
if r <> '' then pause,end

ierr = execstr('basename(emptystr(2,2))','errcatch');
if basename(emptystr(2,2)) <> emptystr(2,2) then pause,end
