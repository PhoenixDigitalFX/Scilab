// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 8098 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8098
//
// <-- Short Description -->
//    cumsum() did not apply to rational matrices.
// =============================================================================

s = poly(0, "s");
r = [1/s 1/s; 1/s^2 1];

assert_checkequal(cumsum(r), [1 1+2*s;1+s 1+2*s+s^2]./[s s^2;s^2 s^2]);
assert_checkequal(cumsum(r,"*"), [1 1+2*s;1+s 1+2*s+s^2]./[s s^2;s^2 s^2]);
assert_checkequal(cumsum(r, 1), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r, 2), [1 2;1 1+s^2]./[s s;s^2 s^2]);
assert_checkequal(cumsum(r, "r"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r, "c"), [1 2;1 1+s^2]./[s s;s^2 s^2]);
assert_checkequal(cumsum(r, "m"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r,"native"), [1 1+2*s;1+s 1+2*s+s^2]./[s s^2;s^2 s^2]);
assert_checkequal(cumsum(r,"double"), [1 1+2*s;1+s 1+2*s+s^2]./[s s^2;s^2 s^2]);
assert_checkequal(cumsum(r,"*", "native"), [1 1+2*s;1+s 1+2*s+s^2]./[s s^2;s^2 s^2]);
assert_checkequal(cumsum(r, 1, "native"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r, 2, "native"), [1 2;1 1+s^2]./[s s;s^2 s^2]);
assert_checkequal(cumsum(r, "r", "native"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r, "c", "native"), [1 2;1 1+s^2]./[s s;s^2 s^2]);
assert_checkequal(cumsum(r, "m", "native"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r,"*", "double"), [1 1+2*s;1+s 1+2*s+s^2]./[s s^2;s^2 s^2]);
assert_checkequal(cumsum(r, 1, "double"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r, 2, "double"), [1 2;1 1+s^2]./[s s;s^2 s^2]);
assert_checkequal(cumsum(r, "r", "double"), [1 1;1+s 1+s]./[s s;s^2 s]);
assert_checkequal(cumsum(r, "c", "double"), [1 2;1 1+s^2]./[s s;s^2 s^2]);
assert_checkequal(cumsum(r, "m", "double"), [1 1;1+s 1+s]./[s s;s^2 s]);

// Check error
assert_checkfalse(execstr("cumsum(r, ""toto"")"   ,"errcatch") == 0);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be in the set {%s}.\n"),..
            "cumsum",2,"""*"",""r"",""c"",""m""");
assert_checkerror("cumsum(r, ""toto"")", refMsg);

a = cumsum([1/%z %z/(1+2*%z)]);
assert_checkequal(a, [1/%z (1+2*%z+%z^2)/(%z+2*%z^2)]);

a = cumsum([1/%z %z/(1+2*%z)]');
assert_checkequal(a, [1/%z (1+2*%z+%z^2)/(%z+2*%z^2)]');
