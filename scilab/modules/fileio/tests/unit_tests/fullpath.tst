// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

ierr = execstr("fullpath();","errcatch");
assert_checkequal(ierr, 77);

ierr = execstr("fullpath(''test.sce'',''test.sce'');","errcatch");
assert_checkequal(ierr, 77);

assert_checkequal(fullpath("."), pwd());

cd(TMPDIR);
mkdir(TMPDIR+"/niv1");
mkdir(TMPDIR+"/niv1/niv2");
mkdir(TMPDIR+"/niv1/niv2/niv3");
mputl(" ",TMPDIR+"/niv1/test1.txt");
mputl(" ",TMPDIR+"/niv1/niv2/test2.txt");
mputl(" ",TMPDIR+"/niv1/niv2/niv3/test3.txt");

REF3 = TMPDIR + filesep() + "niv1" + filesep() + "niv2" + filesep() + "niv3" + filesep() + "test3.txt";
REF2 = TMPDIR + filesep() + "niv1" + filesep() + "niv2" + filesep() + "test2.txt";
REF1 = TMPDIR + filesep() + "niv1" + filesep() + "test1.txt";

cd(TMPDIR+"/niv1/niv2/niv3");

r1 = fullpath("../../test1.txt");
assert_checkequal(r1, REF1);

r2 = fullpath("../test2.txt");
assert_checkequal(r2, REF2);

r3 = fullpath("test3.txt");
assert_checkequal(r3, REF3);

r1 = fullpath(REF1);
assert_checkequal(r1, REF1);

r2 = fullpath(REF2);
assert_checkequal(r2, REF2);

r3 = fullpath(REF3);
assert_checkequal(r3, REF3);

REF_M = [REF1, REF2, REF3];
M = ["../../test1.txt", "../test2.txt", "test3.txt"];
assert_checkequal(REF_M, fullpath(M));

