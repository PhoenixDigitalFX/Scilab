// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2934 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2934
//
// <-- Short Description -->
//In the "Bezier surface test" demo, the graphics titles are inverted compared to Scilab 4.1.2 

subplot(211);
a = gca();
a.title.text = "top axes";

subplot(212);
a = gca();
a.title.text = "bottom axes";

// check that the titles are not inverted


