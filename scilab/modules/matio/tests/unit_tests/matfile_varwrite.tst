// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - S/E - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

filename=TMPDIR+"/test_matfile.mat";
fd = matfile_open(filename,"w");
matfile_varwrite(fd, "foo", "bar", %t);
A=rand(10,10);
matfile_varwrite(fd, "a", A, %t);
matfile_close(fd);
assert_checktrue(isfile(filename));

fd = matfile_open(filename);
assert_checkequal(matfile_listvar(fd),["foo";"a"]);
matfile_close(fd);
assert_checktrue(isfile(filename));

loadmatfile(filename);
assert_checkequal(foo,"bar");
assert_checkequal(a,A);
