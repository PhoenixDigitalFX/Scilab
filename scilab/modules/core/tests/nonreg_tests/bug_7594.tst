// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge STEER <serge.steer@inria.fr>
// Copyright (C) 2014 - Scilab Enterprises - Anais AUBERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 7594 -->
//
// <-- CLI SHELL MODE -->
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7594
//
// <-- Short Description -->
// Incorrect  error detection since bug 6781 fix

function foo1()
    a=xxxxxxx
endfunction
function foo2()
    a=1:xxxxxxx
endfunction
clear xxxxxxx ;//to make sure xxxxxxx does not exist
assert_checkequal(execstr("foo1()","errcatch"), 999);
assert_checkequal(execstr("foo2()","errcatch"), 999);
