// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 13881 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14042
//
// <-- Short Description -->
// Crash cause by reference to an unset handle
clf;
xstring(0.1,0.1,"foo1");H(1)=gce();
xstring(0.1,0.2,"foo1");H(3)=gce();

assert_checkequal(H.type, ["Text" ; "????" ; "Text"]);

errmsg = msprintf(gettext("''%s'' property does not exist for this handle.\n"), "text");
assert_checkerror("H(2).text",errmsg);
