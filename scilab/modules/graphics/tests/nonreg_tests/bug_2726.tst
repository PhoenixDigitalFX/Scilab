// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Jean-Baptiste Silvy <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 2726 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2708
//
// <-- Short Description -->
// xrect hangs scilab with auto_clear mode "on"

axes = gca();
a.auto_clear = "on";

// used to hang scilab
xrect([0,1,1,1]);


