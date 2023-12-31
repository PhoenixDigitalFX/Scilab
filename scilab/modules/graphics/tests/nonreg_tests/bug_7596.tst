// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 7596 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7596
//
// <-- Short Description -->
// The same error happening in two different places should yield the same error message in Scilab console.
// Here, testing the error number 200 because it is the only newly-implemented one.

// Run with test_run('output_stream', 'bug_7596', ['no_check_error_output'])

refMsg = msprintf(_("%s: Wrong type for input argument #%d: Matrix of handle expected.\n"), "is_handle_valid", 1);
assert_checkerror("is_handle_valid(1.23);", refMsg);
