// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 13084 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13084
//
// <-- Short Description -->
// Interp_mode could not be set on all datatips of the same polyline

x=-5.001:0.1:5;
y=sin(x)./x;
plot2d(x,y);
e=gce();
e=e.children(1);

b=%f
for i=1:10:100
    d=datatipCreate(e,i);
    datatipSetInterp(d,b);
    b=~b;
end

d=e.datatips;
assert_checkequal(d.interp_mode, ["on" "off" "on" "off" "on" "off" "on" "off" "on" "off"]');
datatipSetInterp(e,%t);
assert_checkequal(d.interp_mode, ["on" "on" "on" "on" "on" "on" "on" "on" "on" "on"]');
datatipSetInterp(e,%f);
assert_checkequal(d.interp_mode, ["off" "off" "off" "off" "off" "off" "off" "off" "off" "off"]');