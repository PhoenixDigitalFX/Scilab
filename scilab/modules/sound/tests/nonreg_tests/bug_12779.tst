// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 12779 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12779
//
// <-- Short Description -->
// Function "savewave" has a miscoding in the internal function "write_wavedat"
//
t = 0 : 1/22050 : 0.5*(1-%eps);
s=sin(2*%pi*440*t)+sin(2*%pi*220*t)/2+sin(2*%pi*880*t)/2;
t(11026)=0.500001;
nc=size(t,2);
nc=nc+1;

assert_checktrue(execstr("savewave(TMPDIR+''/bug_12779.wav'',s, 22050, 2);", "errcatch")==0);
