//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 3842 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3842
//
// <-- Short Description -->
// sum applyed to integer arrys can only procuce results computed using native operations.
exec SCI/modules/elementary_functions/tests/unit_tests/prod.tst
exec SCI/modules/elementary_functions/tests/unit_tests/cumprod.tst
exec SCI/modules/elementary_functions/tests/unit_tests/prod.tst
exec SCI/modules/elementary_functions/tests/unit_tests/cumprod.tst
