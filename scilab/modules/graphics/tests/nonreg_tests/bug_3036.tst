// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 3036 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3036
//
// <-- Short Description -->
// After a stacksize problem (lack of memory) during a surface plot, it is no longer possible to plot in the graphics window: nothing appears.

close(winsid());
x=linspace(-%pi,%pi,1000)';
ierr = execstr("surf(x,x,sin(x)*cos(x)'');","errcatch");
if ierr <> 0 then pause,end
x=linspace(-%pi,%pi,100)';
plot(x,x);
curfig = gcf();
if curfig.figure_id <> 0 then pause,end;
plot();

