// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->
// ============================================================================
// Unitary tests for mxCreateDoubleMatrix, mxCreateDoubleScalar mex function
// ============================================================================

cd(TMPDIR);
ilib_verbose(0);
mputl([ "#include ""mex.h""";
"";
"void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])";
"{";
"   int i = 0;";
"   double dblM = 0;";
"   double dblN = 0;";
"   double *pdbl = NULL;";
"   mxArray* pOut1 = NULL;";
"   mxArray* pOut2 = NULL;";
"";
"   if(nrhs != 2 || nlhs != 2 /*|| !mxIsDouble(prhs[0])*/)";
"   {";
"       mexErrMsgTxt(""Wrong number or type of input argument"");";
"   }";
"";
"   dblM = mxGetScalar(prhs[0]);";
"   dblN = mxGetScalar(prhs[1]);";
"   pOut1 = mxCreateDoubleMatrix((int)dblM, (int)dblN, mxREAL);";
"   pOut2 = mxCreateDoubleScalar(dblM * dblN);";
"   pdbl = mxGetPr(pOut1);";
"   for(i = 0 ; i < dblM * dblN ; i++)";
"   {";
"       pdbl[i] = i+1;";
"   }";
"";
"   plhs[0] = pOut1;";
"   plhs[1] = pOut2;";
"}"],"mexCreateDoubleScalar.c");
ilib_mex_build("libmextest",["createDouble","mexCreateDoubleScalar","cmex"],"mexCreateDoubleScalar.c",[]);
exec("loader.sce");

m = 3;
n = 4;
[a,b] = createDouble(m, n);
assert_checkequal(b, m*n);
assert_checkequal(a(:)', 1:m*n);
