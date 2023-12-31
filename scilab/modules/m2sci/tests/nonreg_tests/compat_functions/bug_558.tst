//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 558 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/558
//
// <-- Short Description -->
//    mtlb_save reports an unnecessary warning. This is due to
//    line 57 of  SCI/modules/m2sci/macros/compat_functions/mtlb_save.sci:
//
//      clear('rhs','lhs','kk','k','err','mtlb_thefile','or');
//
//    the last 'or' looks superfluous to me.

// 2009-01-09 mtlb_save is removed => savematfile

fileName = TMPDIR+'/bug558.mat';
x = 20;
warning('off');
savematfile(fileName,'x');
warning('on');
w=fileinfo(fileName);
if ( (w == []) | (w(1) == 0) )  then pause,end
mdelete(fileName);
