//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 1508 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1508
//
// <-- Short Description -->
//    A transfer function with small numeric values is assumed not to be SISO, when used in 'csim'.

clear;
s=poly(0,"s");
t=0:1e-25:1e-20;
s1=syslin("c",1/(1+1e-21*s));

if execstr("s2=csim(""step"",t,s1);","errcatch")<>0 then pause,end

