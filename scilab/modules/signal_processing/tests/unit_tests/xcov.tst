//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

x=[1 2 3 4 3 2 1];
assert_checktrue(xcorr(x-mean(x))==xcov(x));

x=[1 2*%i 3 4 3 2 1];
assert_checktrue(xcorr(x-mean(x))==xcov(x));


x=[1 2 3 4 3 2 1];
y=[4 3 2 1];
assert_checktrue(xcorr(x-mean(x),y-mean(y))==xcov(x,y));

x=[1 2 3 4 3 2 1];
y=[4 3 2 1+%i];

assert_checktrue(xcorr(x-mean(x),y-mean(y))==xcov(x,y));
