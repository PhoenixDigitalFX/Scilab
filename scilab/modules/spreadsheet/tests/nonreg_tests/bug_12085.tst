//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 12085 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12085
//
// <-- Short Description -->
// On Windows csvWrite wrote wrong EOL.

fileOut = TMPDIR + "/bug_12085.csv";
stringOut = [1,1;1,1];
data_ref = [49 44 49];

if getos() == "Windows" then
    eol = [13 10]; //CRLF
else
    eol = [10]; //LF
end

ref = [data_ref, eol, data_ref, eol];

csvWrite(stringOut, fileOut);
stringIn = mgetl(fileOut);

info = fileinfo(fileOut);
fd = mopen(fileOut, "rb");
data_read = mget(info(1), "c", fd);
mclose(fd);

assert_checkequal(data_read, ref);
