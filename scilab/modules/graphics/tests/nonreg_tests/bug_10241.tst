// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
//
// <-- Non-regression test for bug 10241 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10241
//
// <-- Short Description -->
// Can not open a .scg file when a non-ascii character is in the legend.


// SOD format save/load
f=scf(0);
x=[-5:.1:5]';
plot2d(x,[2*x 3*x]);
legend(["2x (µm)","3x (µm)"],2);
save("TMPDIR/bug_10241.scg", "f");
delete(f);
load("TMPDIR/bug_10241.scg");
a=gca();
assert_checkequal(a.children(1).text, ["2x (µm)","3x (µm)"]');
delete(gcf());
