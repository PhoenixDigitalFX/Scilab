// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2019 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- LONG TIME EXECUTION -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/16181
//
// <-- Short Description -->
// Unit tests for replacing the "end" index

// Getting replace_end_dollar() as public:
exec("SCI/modules/m2sci/macros/kernel/m2sci_syntax.sci",-1);

txt = mgetl("SCI/modules/m2sci/tests/unit_tests/conversion/END_index_syntax.m");
printf("%s\n", replace_end_dollar(txt));
