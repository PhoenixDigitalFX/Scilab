//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 1776 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1776
//
// <-- Short Description -->
// funcprot accepts non-integer arguments

ierr = execstr('funcprot(2.5)','errcatch');
if ierr <> 999 then pause,end