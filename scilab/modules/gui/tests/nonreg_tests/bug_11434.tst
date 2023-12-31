// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 11434 -->
//
// <-- INTERACTIVE TEST -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11434
//
// <-- Short Description -->
// After create a figure with gdf we can't plotting.

f=gdf();
f.auto_resize = "off";
f=gcf();
plot

// check that the plot and the scrool pane are displayed.
