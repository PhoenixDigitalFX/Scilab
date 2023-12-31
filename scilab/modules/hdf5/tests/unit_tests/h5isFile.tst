// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - SCILAB ENTERPRISES - Simon GARESTE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->

msgerr = msprintf(gettext("%s: Wrong number of input argument(s): %d expected.\n"), "h5isFile", 1);
assert_checkerror("h5isFile()",msgerr,77);
assert_checkfalse(h5isFile("42"));
assert_checkfalse(h5isFile(42));

w = "testing";
x = 1:10;
y = [1 2;3 4];
z = 1;
save(TMPDIR + "/w.sod", "w");
save(TMPDIR + "/x.sod", "x");
save(TMPDIR + "/y.sod", "y");
save(TMPDIR + "/z.sod", "z");

a = h5open(TMPDIR + "/w.sod", "r");
assert_checkequal(h5isFile(a),%T);
assert_checkequal(h5isFile(a.root),%F);
assert_checkequal(h5isFile(a.root.w),%F);
h5close(a);

b = h5open(TMPDIR + "/x.sod", "r");
assert_checkequal(h5isFile(b),%T);
assert_checkequal(h5isFile(b.root),%F);
assert_checkequal(h5isFile(b.root.x),%F);
h5close(a);

c = h5open(TMPDIR + "/y.sod", "r");
assert_checkequal(h5isFile(c),%T);
assert_checkequal(h5isFile(c.root),%F);
assert_checkequal(h5isFile(c.root.y),%F);
h5close(c);

d = h5open(TMPDIR + "/z.sod", "r");
assert_checkequal(h5isFile(d),%T);
assert_checkequal(h5isFile(d.root),%F);
assert_checkequal(h5isFile(d.root.z),%F);
h5close(d);
