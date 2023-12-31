// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13102 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13102
//
// <-- Short Description -->
// savematfile did not support "-v7.3" option.

A = rand(10,10);

testfile = fullfile(TMPDIR, "bug_13102.mat");
savematfile(testfile, "A", "-v7.3");

refA = A;
clear A;

loadmatfile(testfile);
assert_checkequal(refA, A);
deletefile(testfile);


// Create an empty Matlab 7.3 file ready for writing
fd = matfile_open(testfile, "w", "7.3");
assert_checkequal(fd, 0);

matfile_close(fd);
assert_checktrue(isfile(testfile));
deletefile(testfile);
