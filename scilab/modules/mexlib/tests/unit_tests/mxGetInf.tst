// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - Gsoc 2011 - Iuri SILVIO
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxGetInf mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl(["#include ""mex.h""";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"    double dblInf = mxGetInf();";
"    mxArray* pOut = mxCreateDoubleScalar(dblInf);";
"    plhs[0] = pOut;";
"}"],"mexgetInf.c");
ilib_mex_build("libmextest",["getInf","mexgetInf","cmex"], "mexgetInf.c",[]);
exec("loader.sce");

assert_checkequal(getInf(), %inf);
