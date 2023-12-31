// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// format unitary tests

fmt = format();
format("v")
sqrt(3)
format(10)
sqrt(3)
format(12,"v")
sqrt(3)
format("v",15)
sqrt(3)
format("e")
sqrt(3)
format(10)
sqrt(3)
f = format();
assert_checkequal(f, [0 10]);
format(10,"v");
v = format();
m = [v(2) v(1)];
format(m);
f = format();
assert_checkequal(f, v);

format("v", 10);
f = format();
assert_checkequal(f, [1 10]);

format(20);
f = format();
assert_checkequal(f, [1 20]);

format("e", 10);
f = format();
assert_checkequal(f, [0 10]);

format(20);
f = format();
assert_checkequal(f, [0 20]);

format("e", 10);
f = format();
assert_checkequal(f, [0 10]);

format("v", 10);
f = format();
assert_checkequal(f, [1 10]);

format("v");
f = format();
assert_checkequal(f, [1 10]);

format("e");
f = format();
assert_checkequal(f, [0 10]);

// Test which failed before: https://codereview.scilab.org/#/c/16811/
format("v", 10);
16278*12286
format(11);
16278*12286

format(2);
1.1