// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 13941 -->
//
// <-- CLI SHELL MODE -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13941
//
// <-- Short Description -->
//
// HDF5: internal timestamps prevent having a fixed hash for an unvarying set of saved objects

a = 1;
save(TMPDIR+"/test.sod", "a");
sleep(1000);  // the timestamp's resolution is 1s
save(TMPDIR+"/test2.sod", "a");
assert_checkequal(getmd5(TMPDIR+"/test.sod"), getmd5(TMPDIR+"/test2.sod"));