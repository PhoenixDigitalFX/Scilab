// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3802 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3802
//
// <-- Short Description -->
//    When Scilab is launched in French, Tcl creates error (when it is working 
// 	  in english)
// <-- FRENCH IMPOSED -->

if getos() <> "Darwin" then
    TclCMD="TCL_EvalStr(""destroy .t;pack [text .t];set ts [expr 12/[tk scaling]];.t conf -tabs $ts;.t cget -tabs"")";
    if execstr(TclCMD, "errcatch")<>0 then pause; end
  end
  