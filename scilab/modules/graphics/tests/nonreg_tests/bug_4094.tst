// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - DIGITEO - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- INTERACTIVE TEST -->

// <-- Non-regression test for bug 4094 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4094
//
// <-- Short Description -->
// delete("all") does not refresh the graphic.
// 

plot(1:10);

delete("all");

// check that the figure is cleared


