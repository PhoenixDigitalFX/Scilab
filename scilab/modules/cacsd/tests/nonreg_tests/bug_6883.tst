// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Yann COLLETTE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 6883 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6883
//
// <-- Short Description -->
//  black fails to plot integrators

s = poly (0, "s");
P1= syslin('c',(1/s));
frq=0.001:0.01:100;
[frq1,rep]=repfreq(P1,frq);
ierr = execstr('black(frq1,rep)','errcatch');
if ierr then pause,end
