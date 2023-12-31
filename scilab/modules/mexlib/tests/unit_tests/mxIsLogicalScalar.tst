// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - Gsoc 2011 - Iuri SILVIO
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxIsLogicalScalar mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl([ "#include ""mex.h""";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"    plhs[0] = mxCreateLogicalScalar(mxIsLogicalScalar(prhs[0]));";
"    plhs[1] = mxCreateLogicalScalar(mxIsLogicalScalarTrue(prhs[0]));";
"}"],"mexisLogicalScalar.c");
ilib_mex_build("libmextest", ["isLogicalScalar", "mexisLogicalScalar", "cmex"], "mexisLogicalScalar.c", []);
exec("loader.sce");

[out1, out2] = isLogicalScalar(%t);
[out3, out4] = isLogicalScalar(%f);

assert_checktrue(out1);
assert_checktrue(out2);
assert_checktrue(out3);
assert_checkfalse(out4);
