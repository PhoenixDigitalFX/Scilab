// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// non regression bug for clipping

plot(1:10);

// get the handle on the poyline
polyline = gce();
polyline = polyline.children(1);

// set clip box
// used to removed the whole line
polyline.clip_box = [2,7,5,5];
polyline.clip_state = "on";

//add a rectangle around the clip box
xrect(2,7,5,5);

