// ===================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// ===================================================================

s = "Hello World !";
assert_checkequal(jgetfields(jwrap(s)), "CASE_INSENSITIVE_ORDER");

