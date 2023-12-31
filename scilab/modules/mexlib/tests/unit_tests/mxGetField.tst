// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - Gsoc 2011 - Iuri SILVIO
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxGetField mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl(["#include ""mex.h""";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"    mxArray *value = mxGetField(prhs[0], 0, ""a"");";
"    if (value == NULL) value = mxCreateDoubleScalar(-1);";
"    plhs[0] = value;";
"}"],"mexgetField.c");
ilib_mex_build("libmextest",["getField","mexgetField","cmex"], "mexgetField.c",[]);
exec("loader.sce");

c = struct("a", 5, "b", 2);
r = getField(c);
assert_checkequal(r, 5);

c = struct("b", 32);
r = getField(c);
assert_checkequal(r, -1);

r = getField(1);
assert_checkequal(r, -1);
