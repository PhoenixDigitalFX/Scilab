// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2722 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2722
//
// <-- Short Description -->
// It is impossible to put the "box" graphics property to "off" before issuing a
// plot or plot2d.

dAxes = gda();
dAxes.box="off";
x=linspace(-%pi,%pi,100);
plot2d(x,sin(x));
axes = gca();
// axes box should be off
if (axes.box <> "off") then pause; end;

// reset default model axes
sda();
clf();
axes = gca();
axes.box="off";
x=linspace(-%pi,%pi,100);
plot2d(x,sin(x)); 
// axes box should be off
if (axes.box <> "off") then pause; end

// for plot
sda();
dAxes = gda();
dAxes.x_location = "origin";
dAxes.y_location = "origin";
clf();
plot(1:10);
axes = gca();
// box should be "off" since axes at at origin
if (axes.box <> "off") then pause; end

// for plot
sda();
clf();
dAxes = gda();
dAxes.x_location = "top";
dAxes.y_location = "left";
plot(1:10);
axes = gca();
// box should be "on"
if (axes.box <> "on") then pause; end

