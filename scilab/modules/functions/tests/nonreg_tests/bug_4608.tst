// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 4608 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4608
//
// <-- Short Description -->
// get_function_path returns a non-consistent path

// ver is in "core" module
r = get_function_path('ver');
ref = pathconvert(SCI + '/modules/core/macros/ver.sci',%f);
if getlongpathname(r) <> getlongpathname(ref) then pause,end

ierr = execstr('get_function_path(1)','errcatch');
if ierr <> 10000 then pause,end

ierr = execstr('get_function_path([''ver'',''typeof''])','errcatch');
if ierr <> 10000 then pause,end
