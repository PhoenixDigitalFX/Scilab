// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 7649 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7649
//
// <-- Short Description -->
//  isempty() returned %F  on {}, list(,) struct() or struct without field
// =============================================================================

assert_checktrue(isempty({}));
assert_checktrue(isempty(struct()));
assert_checktrue(isempty(list(,)));
assert_checktrue(isempty(list(,[],struct(),{}, list(,))));
assert_checktrue(isempty({[],struct(),{}, list(,)(1)}));
s(1).w = list(,);
s(2).w = struct();
s(3).w = {};
s(4).w = [];
assert_checktrue(isempty(s));
s.w = null();
assert_checktrue(isempty(s));
