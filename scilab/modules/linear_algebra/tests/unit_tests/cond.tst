// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// unit tests for cond function
// =============================================================================

// Interface
// ===========

assert_checkfalse(execstr("cond()", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong number of input argument(s): %d to %d expected.\n"), "cond", 1, 2);
assert_checkerror("cond()", refMsg);

assert_checkfalse(execstr("cond(1,2,3)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong number of input argument(s): %d to %d expected.\n"), "cond", 1, 2);
assert_checkerror("cond(1,2,3)", refMsg);

assert_checkfalse(execstr("cond(%nan)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: must not contain %s or %s.\n"), "cond", 1, "%nan", "%inf");
assert_checkerror("cond(%nan)", refMsg);

assert_checkfalse(execstr("cond(%inf)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: must not contain %s or %s.\n"), "cond", 1, "%nan", "%inf");
assert_checkerror("cond(%inf)", refMsg);

assert_checkfalse(execstr("cond(%f)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A matrix expected.\n"), "cond", 1);
assert_checkerror("cond(%f)", refMsg);

assert_checkfalse(execstr("cond(""ah"")", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A matrix expected.\n"), "cond", 1);
assert_checkerror("cond(""ah"")", refMsg);

assert_checkfalse(execstr("cond(""ah"")", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A matrix expected.\n"), "cond", 1);
assert_checkerror("cond(""ah"")", refMsg);

assert_checkfalse(execstr("cond(""ah"", 1)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A square matrix expected.\n"), "cond", 1);
assert_checkerror("cond(""ah"", 1)", refMsg);

assert_checkfalse(execstr("cond(1, %f)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A scalar or a string expected.\n"),"cond", 2);
assert_checkerror("cond(1, %f)", refMsg);

assert_checkfalse(execstr("cond(1, 3)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: must be %d, %d, %s, ''%s'' or ''%s''.\n"), "cond", 2, 1, 2, "%inf", "inf", "fro");
assert_checkerror("cond(1, 3)", refMsg);

assert_checkfalse(execstr("cond([8 5 2;4 5 6], 1)", "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: A square matrix expected.\n"),"cond", 1);
assert_checkerror("cond([8 5 2;4 5 6], 1)", refMsg);

// cond(A)
assert_checkalmostequal(cond([]), 0);
assert_checkalmostequal(cond([],1), 0);
assert_checkalmostequal(cond([],2), 0);
assert_checkalmostequal(cond([],%inf), 0);
assert_checkalmostequal(cond([],"fro"), 0);

A = [8 5 2;4 5 6];
assert_checkalmostequal(cond(A), 3.1529469);

A = A * %i;
assert_checkalmostequal(cond(A), 3.1529469);

A = [9 0 3;2 5 0;7 4 1];
assert_checkalmostequal(cond(A), 23.411565);

assert_checkalmostequal(cond(A,1), 33);

assert_checkalmostequal(cond(A, %inf), 36);

assert_checkalmostequal(cond(A, 'inf'), 36);

assert_checkalmostequal(cond(A, 'fro'), 25.702776, 1e-7);

A = A * %i;
assert_checkalmostequal(cond(A), 23.411565);

assert_checkalmostequal(cond(A,1), 33);

assert_checkalmostequal(cond(A, %inf), 36);

assert_checkalmostequal(cond(A, 'inf'), 36);

assert_checkalmostequal(cond(A, 'fro'), 25.702776, 1e-7);
