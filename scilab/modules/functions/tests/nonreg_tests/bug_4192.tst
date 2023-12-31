// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Pierre MARECHAL <pierre.marechal@scilab.org>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 4192 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4192
//
// <-- Short Description -->
//    When I do a getd in a directory where there are no .sci files, getd prints
//    an error message. The error message should be clearer


test_dir  = TMPDIR+"/dir_bug_4192";
test_file = test_dir+"/file.sci.bug_4192";

mkdir(test_dir);
if ~isdir(test_dir) then pause,end

cd(test_dir);

execstr("getd(""."")","errcatch");
if( regexp(lasterror(),"/getd: I cannot find any files with extension/") <> 1 ) then pause,end

mputl("Hello World",test_file);
execstr("getd(""."")","errcatch");
if( regexp(lasterror(),"/getd: I cannot find any files with extension/") <> 1 ) then pause,end
