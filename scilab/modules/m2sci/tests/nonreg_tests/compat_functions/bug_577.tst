//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 577 -->
// <-- ENGLISH IMPOSED -->
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/577
//
// <-- Short Description -->
//    It can't save imaginary in MATLAB format (SCILAB 2.7.x and
//    cvs version)
//
//    I can reproduce the bug with integers data type not with imaginary

// 2009-01-09 mtlb_save is removed => savematfile
// 2015-04-13 savematfile allows double of any dimension

my_mat_file = TMPDIR+"/bug_577.mat";

x=rand(5,5,100)+%i*rand(5,5,100);
savematfile(my_mat_file,"x");

ref = x;
clear x;

loadmatfile(my_mat_file);
assert_checkequal(x,ref);