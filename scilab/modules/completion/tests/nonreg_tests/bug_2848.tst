// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 2848 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2848
//
// <-- Short Description -->
//    When using the TAB key for completion in the console, after using once a Scilab
//    macro, its name appears twice in the completion list: as a macro and as a variable.


[a, b, c, d] = completion("with");
assert_checkequal(c, []);

with_javasci();
[a, b, c, d]=completion("with");
assert_checkequal(c, []);

clear with_javasci
[a, b, c, d]=completion("with");
assert_checkequal(c, []);

with_javasci();

function x = with_foo(y, z)
    x = y + z;
endfunction

[a, b, c, d] = completion("with");
ref_a = ["with_module"];
ref_b = [];
ref_c = [];
ref_d = ["with_foo"; ..
"with_javasci"; ..
"with_macros_source"; ..
"with_modelica_compiler"];

assert_checkequal(a, ref_a);
assert_checkequal(b, ref_b);
assert_checkequal(c, ref_c);
assert_checkequal(d, ref_d);

clear with_javasci with_foo

[a,b,c,d] = completion("with");
assert_checkequal(c, []);
