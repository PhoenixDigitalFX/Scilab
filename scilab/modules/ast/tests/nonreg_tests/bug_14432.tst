// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 14432 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14432
//
// <-- Short Description -->
// Mysterious anomaly makes Scilab crash

function [res] = F(x)
    res = struct();
    res.y = x;
endfunction

err=execstr("F(x = (1:4));", "errcatch");
assert_checkequal(err, 0);
