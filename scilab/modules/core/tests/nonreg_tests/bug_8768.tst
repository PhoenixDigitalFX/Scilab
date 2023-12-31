// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 8768 -->
//
// <-- CLI SHELL MODE -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8768
//
// <-- Short Description -->
// GetRhsVar(..., STRING_DATATYPE did not check size of input argument

msgerr = msprintf(_("%s: Wrong size for input argument #%d: String expected.\n"), "with_module", 1);
assert_checkerror("with_module([""ffa"", ""ff""])", msgerr);

msgerr = msprintf(_("%s: Wrong size for input argument #%d: string expected.\n"), "clearfun", 1);
assert_checkerror("clearfun([""myfuncA"", ""myfuncB""])", msgerr);

msgerr = msprintf(_("%s: Wrong value for input argument #%d: ''%s'' or ''%s'' expected.\n"), "format", 1, "e", "v");
assert_checkerror("format([""e"", ""v""])", msgerr);

