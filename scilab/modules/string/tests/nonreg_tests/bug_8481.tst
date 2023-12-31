// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 8481 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8481
//
// <-- Short Description -->
// Scilab crashed when display a rational containing a complex.
//

// the bug came from the use of emptystr() in %r_p.sci
a='a';
emptystr();
s=size(emptystr(a));
if s(2) ~= 1 then, pause, end