// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9285 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9285
//
// <-- Short Description -->
// g_margin returned bad results in some special cases.
s=%s;
Kp=2.054;
Ki=0.13383297644539613;
Td=0.605;
Kd=5.0;
ts=0.25;
k=0.001712328003555509;
tw=1.4731525037117905;
ta=8.678149822856799;
au=0.0;
ty=0.1;

Process=(k*s^2-tw*s+1)/((k*s^2+(tw/2)*s+1)*(1+ts*s)^2*(ta*s+au));
FeedBack=1/((ty*ty)*s^2+(ty*2^0.5)*s+1) * (1 + (Kd*Td*s)/(Kd+Td*s));
REG=(Kp * ( 1 + Ki/s));

FT20_0_ = syslin("c", REG * Process * FeedBack);
[gm,fr]=g_margin(FT20_0_);
assert_checkalmostequal(fr,0.11730083,0,6e-9);
assert_checkalmostequal(gm,6.69326173,0,6e-9);

FT20_0 = tf2ss(FT20_0_);
[gm,fr]=g_margin(FT20_0);
assert_checkalmostequal(fr,0.11730083,0,6e-9);
assert_checkalmostequal(gm,6.69326173,0,6e-9);
