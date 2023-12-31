// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 10670 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10670
//
// <-- Short Description -->
// There was a crash with xmlRead when argument had a bad dimension.
//

asserterrmsg = sprintf(gettext("%s: Wrong type for input argument #%d: string expected.\n"), "xmlRead" , 1);
assert_checkerror("xmlRead([""aze"" ""aze""])", asserterrmsg);