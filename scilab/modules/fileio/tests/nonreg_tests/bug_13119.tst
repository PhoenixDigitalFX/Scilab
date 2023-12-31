// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13119 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13119
//
// <-- Short Description -->
// mget and mgetl accepted decimal values as number of lines.

curdir = pwd();
cd(TMPDIR);

fd = mopen("test", "w"); // Open a file

refMsg = msprintf(_("%s: Wrong value for input argument #%d: A positive integer value expected.\n"), "mget", 1);
assert_checkerror("mget(-1, ""d"", fd)", refMsg);

refMsg = msprintf(_("%s: Wrong value for input argument #%d: A positive integer value expected.\n"), "mget", 1);
assert_checkerror("mget(1.5, ""d"", fd)", refMsg);

refMsg2 = msprintf(_("%s: Wrong type for input argument #%d: A positive integer value expected.\n"), "mget", 1);
assert_checkerror("mget(int8(1), ""d"", fd)", refMsg2);

refMsg3 = msprintf(_("%s: Wrong value for input argument #%d: An integer value expected.\n"), "mgetl", 2);
assert_checkerror("mgetl(""test"", 1.5)", refMsg3);

refMsg4 = msprintf(_("%s: Wrong type for input argument #%d: An integer value expected.\n"), "mgetl", 2);
assert_checkerror("mgetl(""test"", int8(1))", refMsg4);

mclose(fd);
deletefile("test");

cd(curdir);
