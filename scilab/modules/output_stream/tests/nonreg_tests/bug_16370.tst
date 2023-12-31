// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2020 - ESI Group - Clement DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 16370 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/16370
//
// <-- Short Description -->
// msprintf() did not handle dollars to render LaTeX strings

// should not error !
msprintf("$\\Large \\alpha=%5.2f$",1)



