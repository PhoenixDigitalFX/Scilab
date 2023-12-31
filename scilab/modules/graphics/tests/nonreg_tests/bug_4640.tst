// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 4640 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4640
//
// <-- Short Description -->
// plot2d() puts CPU utilization at 100% on Windows.
clf();
plot2d(0:1,0:1,rect=[0 0 1 1],nax=[1 6 1 6]);
a = gca();
p = a.x_ticks.locations;
v0 = a.x_ticks.labels;
drawaxis(x=a.x_ticks.locations,y=0.5,dir="u",tics="v",val=v0);
e=gce();
v1="$"+v0+"$";
e.tics_labels=v1';

