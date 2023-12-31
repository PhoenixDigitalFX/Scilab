// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 11941 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11941
//
// <-- Short Description -->
// show_margins() fails in 'nyquist' mode if the system is in state-space form. It
// assumes the system is in transfer function form and calls horner() with it.

h=syslin('c',0.02909+0.11827*%s+0.12823*%s^2+0.35659*%s^3+0.256*%s^4+0.1*%s^5,..
             0.0409+0.1827*%s+1.28225*%s^2+3.1909*%s^3+2.56*%s^4+%s^5);
h1=tf2ss(h);
assert_checktrue(execstr("show_margins(h1,""nyquist"");","errcatch")==0);
