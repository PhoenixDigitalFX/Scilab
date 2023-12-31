// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 8789 -->

// <-- Short Description -->
// read function crashed on Windows XP 64 bit platform
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8789
//

filetoread = SCI + "/modules/io/tests/nonreg_tests/bug_8789.txt";
ref = mgetl(filetoread);

fic = file("open", filetoread, "old");

if execstr("r = read(fic, 1, 1, ""(a)"");", "errcatch") <> 0 then pause, end
file("close", fic);
if r <> ref(1) then pause, end

fic = file("open", filetoread, "old");
if execstr("r = read(fic, 2, 1, ""(a)"");", "errcatch") <> 0 then pause, end
file("close", fic);
if or(r <> ref(1:2)) then pause, end

fic = file("open", filetoread, "old");
if execstr("r = read(fic, -1, 1, ""(a)"");", "errcatch") <> 0 then pause, end
file("close", fic);
if or(r <> ref) then pause, end

