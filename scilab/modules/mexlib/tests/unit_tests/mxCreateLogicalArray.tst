// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - Gsoc 2011 - Iuri SILVIO
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxCreateLogicalArray mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl([ "#include ""mex.h""";
"";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"   int ndim = (int) mxGetScalar(prhs[0]);";
"   int *dims = (int *) mxGetData(prhs[1]);";
"   plhs[0] = mxCreateLogicalArray(ndim, dims);";
"}"],"mexCreateLogicalArray.c");
ilib_mex_build("libmextest",["createLogicalArray", "mexCreateLogicalArray", "cmex"], "mexCreateLogicalArray.c", []);
exec("loader.sce");

a = createLogicalArray(4, int32([2 2 2 2]));
assert_checkequal(size(a, "*"), 16);
assert_checkequal(typeof(a), "boolean");
