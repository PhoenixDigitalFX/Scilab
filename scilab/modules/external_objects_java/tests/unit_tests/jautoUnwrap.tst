// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

jautoUnwrap(%t)
assert_checktrue(jautoUnwrap());
jautoUnwrap(%f);
assert_checkfalse(jautoUnwrap());
jautoUnwrap(%t); // Plug back the normal behavior

c = jcompile("Test", ["public class Test {";"public static double foo(double d) { return d; }";"}"]);
jautoUnwrap(%f);
assert_checkequal(typeof(c.foo(12)), "_EObj");

jautoUnwrap(%t);
assert_checkequal(typeof(c.foo(12)), "constant");
