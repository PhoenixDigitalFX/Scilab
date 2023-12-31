// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7650 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7650
//
// <-- Short Description -->
// isempty(tlist(...)) always returned %f, ewen when all defined fields were empty.

TL=tlist(["test" "num" "str" "lst"],[],"",list([],""));
assert_checktrue(isempty(TL));

t = tlist(["listtype","field1","field2"], [], []);
assert_checktrue(isempty(t));

t.field1 = "";
assert_checktrue(isempty(t));

t.field2 = "";
assert_checktrue(isempty(t));

t.field1 = [];
assert_checktrue(isempty(t));

t = tlist(["test"]);
assert_checktrue(isempty(t));
