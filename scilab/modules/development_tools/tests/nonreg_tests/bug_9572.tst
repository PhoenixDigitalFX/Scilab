// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 9572 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9572
//
// <-- Short Description -->
// assert_checkerror did not check multi lines errors


cmd = "error(''line1'' + ascii(10) + ''line2'')";
ref_msgerr = ['line1';'line2'];
ref_ierr = 10000;

// first, we check without assert_checkerror
ierr = execstr(cmd, 'errcatch');
msgerr = lasterror();
assert_checkequal(ierr, ref_ierr);
assert_checkequal(msgerr, ref_msgerr);


// real test case
assert_checkerror(cmd, ref_msgerr);

