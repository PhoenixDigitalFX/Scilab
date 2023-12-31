// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// test to check that generated files are not empty

// create some data to export
scf();
plot2d;
plot3d;

// try all kinds of exports
fig = gcf();
figIndex =fig.figure_id;


// vectorial export
// check that file size is greater than 80K
// increase minimum size
minimumSize = 80000;

xs2pdf(figIndex, TMPDIR+"/textExport.pdf")
fileSize = fileinfo(TMPDIR+"/textExport.pdf");
if (fileSize(1) < minimumSize) then pause; end;
mdelete(TMPDIR+"/textExport.pdf");