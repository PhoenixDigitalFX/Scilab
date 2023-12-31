// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4799 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4799
//
// <-- Short Description -->
// Some times the bode, nyquist , ... function report a "non convergence" error


s = poly(0,'s');
tau=.011; a=82.794; b=103.089;
S = a/(s*tau-b);
n=22; Sn = (1+S)^n-1; Snw = syslin('c',Sn);

if execstr('[frq,bnds,splitf]=calfrq(Snw,100,20000)','errcatch')<>0 then pause,end
if execstr('[frq,bnds,splitf]=calfrq(Snw,0.01,1000000)','errcatch')<>0 then pause,end

s = poly(0,'s');
tau=11; a=82.794; b=103.089;
S = a/(s*tau-b);
n=20; Sn = (1+S)^n-1; Snw = syslin('c',Sn);
if execstr('[frq,bnds,splitf]=calfrq(Snw,0.1,20)','errcatch')<>0 then pause,end
