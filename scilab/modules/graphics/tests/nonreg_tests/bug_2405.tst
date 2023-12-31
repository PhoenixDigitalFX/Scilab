// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- INTERACTIVE TEST -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 2405 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2405
//
// <-- Short Description -->
// xsetech() creates an empty (covering white) axes frame, which shouldn't be, when
// used in conjunction with subplot().
//

clf()
subplot(121); plot2d();
e = gca().axes_bounds;
xsetech(e)
subplot(122); plot2d()

// check that the first plot did not become white

