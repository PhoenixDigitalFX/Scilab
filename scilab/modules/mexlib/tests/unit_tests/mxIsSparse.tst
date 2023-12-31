// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2017-2017 - Gsoc 2017 - Siddhartha Gairola
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxIsSparse mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl(["#include ""mex.h""";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"    bool isSparse = mxIsSparse(prhs[0]);";
"    mxArray* pOut = mxCreateLogicalScalar(isSparse);";
"    plhs[0] = pOut;";
"}"],"mexisSparse.c");

ilib_mex_build("libmextest",["isSparse","mexisSparse","cmex"], "mexisSparse.c",[]);
exec("loader.sce");

sp = sparse([1,2;4,5;3,10],[1,2,3]);
sp_bool = sparse([%F, %F, %F, %T]);
n_sp = [1 2 3; 4 5 6];

assert_checkfalse(isSparse(n_sp));
assert_checktrue(isSparse(sp));
assert_checktrue(isSparse(sp_bool));
