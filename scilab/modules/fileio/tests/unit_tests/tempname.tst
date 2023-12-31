// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// some unit tests about tempname
//

F = tempname();
assert_checkequal(isfile(F), %t);

F = tempname('PRE');
assert_checkequal(isfile(F), %t);

msgerror = "%s: Wrong type for input argument #%d: string expected.\n";
assert_checkerror ( "F = tempname(1)" , msgerror, 999, "tempname" , 1);

msgerror = "%s: Wrong size for input argument #%d: A scalar expected.\n";
assert_checkerror ( "F = tempname([''A'',''B''])" , msgerror, 999, "tempname" , 1);

if getos() == "Windows" then
  msgerror = "%s: Wrong size for input argument #%d: A string (3 characters max.) expected.\n";
  assert_checkerror ( "F = tempname(''toolongasprefixonwindows'')" , msgerror, 999, "tempname" , 1);
end

F = tempname();
[p, f, ext]=fileparts(F);
assert_checkequal(part(f,1:3), "SCI");

F = tempname("TMP");
[p, f, ext] = fileparts(F);
assert_checkequal(part(f,1:3), "TMP");
if getos() == "Windows" then
  assert_checkequal(ext, ".tmp");
end
