// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - Gsoc 2011 - Iuri SILVIO
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================
//
// <-- CLI SHELL MODE -->
//
// ============================================================================
// Unitary tests for mexGetVariablePtr mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl([ "#include ""mex.h""";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"    char *workspace = mxArrayToString(prhs[0]);";
"    char *name = mxArrayToString(prhs[1]);";
"    mxArray *pOut = mexGetVariablePtr(workspace, name);";
"    plhs[0] = pOut != NULL ? pOut : mxCreateString(""NULL"");";
"}"],"mexgetVariablePtr.c");
ilib_mex_build("libmextest", ["getVariablePtr", "mexgetVariablePtr", "cmex"], "mexgetVariablePtr.c", []);
exec("loader.sce");

//create a global var
global globalvar;
globalvar = "my global var";

//create a global var and hide it
global globalvar2;
globalvar2 = "my global var2";
clear globalvar2;

//create a local var
callervar = "my caller var";

assert_checkequal(getVariablePtr("global", "globalvar"), "my global var");
assert_checkequal(getVariablePtr("caller", "globalvar"), "NULL");
assert_checkequal(getVariablePtr("base", "globalvar"), "my global var");

assert_checkequal(getVariablePtr("global", "callervar"), "NULL");
assert_checkequal(getVariablePtr("caller", "callervar"), "my caller var");
assert_checkequal(getVariablePtr("base", "callervar"), "my caller var");

assert_checkequal(getVariablePtr("global", "globalvar2"), "NULL");
assert_checkequal(getVariablePtr("caller", "globalvar2"), "NULL");
assert_checkequal(getVariablePtr("base", "globalvar2"), "NULL");
