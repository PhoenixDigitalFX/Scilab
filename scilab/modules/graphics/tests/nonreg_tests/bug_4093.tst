// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - Digiteo - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 4093 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4093
//
// <-- Short Description -->
// plot2d overrides Y axis location set in default axes.
// 

x = [0:0.1:2*%pi]';
da = gda(); // get the handle of the model axes 

da.x_location = "origin";
da.y_location = "origin";

plot2d(x-2,sin(x))

axes = gca();
if (axes.x_location <> "origin") then pause; end
if (axes.y_location <> "origin") then pause; end

