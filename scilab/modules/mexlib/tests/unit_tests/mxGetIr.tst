// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2017-2017 - Gsoc 2017 - Siddhartha Gairola
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxGetIr mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl([ "#include ""mex.h""";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"   int *ir = NULL;";
"   mxArray* pOut = NULL;";
"   bool check = 0;";
"   ir = mxGetIr(prhs[0]);";
"   if(ir != NULL)";
"   {";
"       check = 1;";
"   }";
"";
"   pOut = mxCreateLogicalScalar(check);";
"   plhs[0] = pOut;";
"}"],"mexGetIr.c");
ilib_mex_build("libmextest",["getIr","mexGetIr","cmex"], "mexGetIr.c",[]);
exec("loader.sce");

sp = sparse([1 2 3]);
not_sp = [1 2 3];
res1 = getIr(sp);
res2 = getIr(not_sp);

assert_checktrue(res1);
assert_checkfalse(res2);
