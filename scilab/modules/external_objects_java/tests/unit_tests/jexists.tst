// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

jimport java.lang.Double;
d = Double.new("1.23456");
assert_checktrue(jexists(d));
jremove d;
assert_checkequal(exists("d"),0);
