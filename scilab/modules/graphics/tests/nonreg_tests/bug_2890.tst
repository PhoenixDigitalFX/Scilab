// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2890 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2890
//
// <-- Short Description -->
// In log mode the ticks and ticks labels are not drawn in scilab5


x=logspace(-2,2,100);
plot(x,x);
a=gca();a.log_flags='ll';

// check that there is ticks along X and Y axes
if (a.x_ticks.labels == []) then pause;end;
if (a.x_ticks.locations == []) then pause;end;
if (a.y_ticks.labels == []) then pause;end;
if (a.x_ticks.locations == []) then pause;end;

