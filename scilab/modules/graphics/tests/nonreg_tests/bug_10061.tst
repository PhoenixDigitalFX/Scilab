// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 10061 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10061
//
// <-- Short Description -->
// datatipCreate draws the tip in the current axes instead of curve parent axes
clf;
subplot(211);a1=gca();
plot(1:10);e=gce();p1=e.children;
subplot(212);a2=gca();
plot(1:10);e=gce();p2=e.children;

datatipCreate(p1,[5,5]);
tips=p1.datatips;
assert_checktrue(tips.parent==p1);
