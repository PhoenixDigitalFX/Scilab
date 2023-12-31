// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - DIGITEO - Simon LIPP <simon.lipp@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 2731 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2731
//
// <-- Short Description -->
//    On 64bit linux, the loadmatfile function does not work with v4 MAT files,
//    complaining about exceeded stacksize.

// <-- CLI SHELL MODE -->

ierr = execstr('loadmatfile(SCI+''/modules/matio/tests/nonreg_tests/t-circle.mat'')', 'errcatch');
if ierr <> 0 then pause,end
