// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 11409 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11409
//
// <-- Short Description -->
// xpoly crash on polyline allocation

xf = 40;
yf = 40;

[orig,sz,orient] = ([0 0], [2 3], [%t]);

inout = 0.6*[ -1  -1
               1  -1
               1   1
              -1   1 ] * diag( [ xf/20, yf/7 ] );

assert_checkequal(execstr("xfpoly(inout(:,1)+ones(4,1)*(orig(1)-xf/30),inout(:,2)+ones(4,1)*(orig(2)+sz(2)/2),1);", "errcatch"), 0);
