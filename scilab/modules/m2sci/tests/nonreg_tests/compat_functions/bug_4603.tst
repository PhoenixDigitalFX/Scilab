// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 4603 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4603
//
// <-- Short Description -->
// Unknown function lst2tree called by function mtlb_eval.

ierr = execstr("mtlb_eval(""a=2"")", "errcatch");

if ierr<>0 then pause; end