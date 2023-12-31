// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - DIGITEO - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4149 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4149
//
// <-- Short Description -->
// Mixing ScilabEval and Tcl_* commands crashes Scilab
//

TCL_EvalStr("ScilabEval ""TCL_EvalStr(''set a 2'')"" sync seq");
if TCL_GetVar("a") <> "2" then pause; end

TCL_EvalStr("ScilabEval ""TCL_CreateSlave(\""TCLinterp\"")"" sync seq");
if TCL_ExistInterp("TCLinterp") == %f then pause; end

TCL_EvalStr("ScilabEval ""TCL_DeleteInterp(\""TCLinterp\"")"" sync seq");
if TCL_ExistInterp("TCLinterp") == %t then pause; end