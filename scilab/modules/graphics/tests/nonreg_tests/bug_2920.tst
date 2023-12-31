// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2920 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2920
//
// <-- Short Description -->
// The demo called "Rectangles, Arcs, Polylines, Segments and Numbers" do not display yellow filled objects.

// should draw a white rectangle (draw a yellow one in Scilab 4).
xrects([0.25;0.75;0.5;0.5], color('white'));
e = gce();
e = e.children;
e.line_mode = "on";




