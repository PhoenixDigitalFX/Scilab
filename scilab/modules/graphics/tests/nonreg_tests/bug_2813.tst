// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2813 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2813
//
// <-- Short Description -->
// 
// - xtitle clips y axis label
// - xtitle adds @ in labels instead of displaying them on several lines

axes = gca();

// first set of labels
titLabel = "MY TITLE";
xLabel = "X axis";
yLabel = "A long name for the Y axis";
zLabel = "";

xtitle(titLabel,xLabel,yLabel);

// check that text is correctly set
if (axes.title.text <> titLabel) then pause; end
if (axes.x_label.text <> xLabel) then pause; end
if (axes.y_label.text <> yLabel) then pause; end
if (axes.z_label.text <> zLabel) then pause; end

// second set of labels
yLabel = ["A long name";"for the Y axis"];

xtitle(titLabel,xLabel,yLabel);

// check that text is correctly set
if (axes.title.text <> titLabel) then pause; end
if (axes.x_label.text <> xLabel) then pause; end
if (axes.y_label.text <> yLabel) then pause; end
if (axes.z_label.text <> zLabel) then pause; end

// third one
xLabel = ["A long label";"for the X axis"];
xtitle(titLabel,xLabel);
if (axes.title.text <> titLabel) then pause; end
if (axes.x_label.text <> xLabel) then pause; end
if (axes.y_label.text <> yLabel) then pause; end
if (axes.z_label.text <> zLabel) then pause; end

// fourth one
titLabel = ["test1","test2";"test3","test4"];
xLabel = ["test1","test2";"test3","test4"];
yLabel = ["test1","test2";"test3","test4"];
zLabel = ["test1","test2";"test3","test4"];
xtitle(titLabel,xLabel,yLabel,zLabel);
if (axes.title.text <> titLabel) then pause; end
if (axes.x_label.text <> xLabel) then pause; end
if (axes.y_label.text <> yLabel) then pause; end
if (axes.z_label.text <> zLabel) then pause; end

