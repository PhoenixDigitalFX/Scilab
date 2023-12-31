// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 13083 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13083
//
// <-- Short Description -->
// Datatip mark did not inherit colors from the polyline

x=-5.001:0.1:5;
y=sin(x)./x;
plot2d(x,y);
e=gce();
e=e.children(1);

e.foreground=3;
e.background=4;

d=datatipCreate(e, 10);
assert_checkequal(d.mark_foreground, e.foreground);
assert_checkequal(d.mark_background, e.background);

e.foreground=-1;
e.background=7;

d=datatipCreate(e, 20);
assert_checkequal(d.mark_foreground, e.foreground);
assert_checkequal(d.mark_background, e.background);