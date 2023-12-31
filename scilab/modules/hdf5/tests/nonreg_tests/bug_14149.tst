// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 14149 -->
//
// <-- CLI SHELL MODE -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14149
//
// <-- Short Description -->
//
//hdf5 cannot read back hypermatrices from hdf5 files

//test hypermatrix to save to / reload from hdf5 file
var(:,:,1)=[111,112,113;121,122,123];
var(:,:,2)=[211,212,213;221,222,223];
var(:,:,3)=[311,312,313;321,322,323];
var(:,:,4)=[411,412,413;421,422,423];

cd TMPDIR;

h5=h5open("var.h5","w");
h5write(h5, "var", var);
h5close(h5);

h5=h5open("var.h5","r");
newvar=h5.root.var.data;
h5close(h5);

assert_checkequal(var, newvar);