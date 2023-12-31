// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Pierre-Aime Agnel
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13272 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13272
//
// <-- Short Description -->
// csvRead does not return in error when looking for comments on a csv file where no comment is present
// csvRead returns an empty matrix for comment in this case

//Creating a test CSV file
dummyFile = TMPDIR + filesep() + "bug_13272.csv";
csvWrite(['1', '', '3'; '', '', '6'], dummyFile);

//Files does not contain 7 as a comment
iErr = execstr("[M, comment] = csvRead(dummyFile, "","", ""."", ""string"", [], ""/7/"")", "errcatch");

assert_checkequal(iErr, 0);
assert_checktrue(isempty(comment));
