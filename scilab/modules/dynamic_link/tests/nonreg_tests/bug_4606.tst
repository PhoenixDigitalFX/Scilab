// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4606 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4606
//
// <-- Short Description -->
// example of link does not work on windows


ilib_verbose(0);
chdir(TMPDIR);
//Example of the use of ilib_for_link with  a simple C code
f1=["#include <math.h>"
"void fooc(double c[],double a[],double *b,int *m,int *n)"
"{"
"   int i;"
"   for ( i =0 ; i < (*m)*(*n) ; i++) "
"     c[i] = sin(a[i]) + *b; "
"}"];

mputl(f1,"fooc.c");

//creating the shared library: a Makefile and a loader are
//generated, the code is compiled and a shared library built.
ilib_for_link("fooc","fooc.c",[],"c");
exec("loader.sce");
// call the new linked entry point
a=linspace(0,%pi,10);
b=5;
y1=call("fooc",a,2,"d",b,3,"d",size(a,1),4,"i",size(a,2),5,"i","out",size(a),1,"d");
assert_checkalmostequal(y1, sin(a) + b);
exec("cleaner.sce");