// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- ENGLISH IMPOSED -->
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 12118 -->
//
// <-- GitLab URL -->
//https://gitlab.com/scilab/scilab/-/issues/12118
//
// <-- Short Description -->
// ode() accepted complex internals

function xdot = f(t, x)
    xdot = %i;
endfunction

x0 = [1; 0];
t0 = 0;
t  = linspace(0, 10, 100);

refMsg = [msprintf(_("%s: Wrong type for output argument #%d: Real matrix expected.\n"), "f", 1);
msprintf(_("%ls: An error occurred in ''%s'' subroutine."), "ode", "lsoda")];
assert_checkerror("y = ode(zeros(1, 1), t0, t, f);", refMsg);
assert_checkerror("y = ode(zeros(1, 2), t0, t, f);", refMsg);
assert_checkerror("y = ode(zeros(1, 3), t0, t, f);", refMsg);
assert_checkerror("y = ode(zeros(1, 4), t0, t, f);", refMsg);
