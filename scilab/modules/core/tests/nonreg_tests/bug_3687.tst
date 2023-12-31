//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3687 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3687
//
// <-- Short Description -->
// "format" doesn't check input value 

current_format = format();

a = format();
if and(a <> [1 10]) then pause,end

format(2);
b = format();
if and(b <> [1 2]) then pause,end

ierr = execstr('format(300000000000000000000000000)','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('format(-1)','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('format(1)','errcatch');
if ierr <> 999 then pause,end

format('v',12)
b = format();
if and(b <> [1 12]) then pause,end

format(13,'v')
b = format();
if and(b <> [1 13]) then pause,end