// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2018 - UTC - Stéphane MOTTELET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 15630 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/15630
//
// <-- Short Description -->
// x(0:2)=1 does not raise an error and x=1;x(0:1,1) crashes Scilab.


assert_checkerror('clear x; x(0:2)=1','Invalid index.');
assert_checkerror('clear x; x(0:$)=1','Invalid index.');
assert_checkerror('clear x; x(0:2,1)=1','Invalid index.');
assert_checkerror('clear x; x(0:$,1)=1','Invalid index.');
assert_checkerror('x=1; x(0:1,1)','Invalid index.');
assert_checkerror('x=1; x(0:$,1)','Invalid index.');
