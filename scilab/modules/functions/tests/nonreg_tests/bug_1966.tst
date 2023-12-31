// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1966 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1966
//
// <-- Short Description -->
//
//     getd doesn't work
//
//-->getd(pwd())
// !--error 998
//Can't go to directory getd(pwd())
//at line 14 of function cd called by :
//cd getd(pwd())

my_dir          = pathconvert(TMPDIR+"/bug_1966",%F,%F);
my_file         = pathconvert(my_dir+"/bug_1966_tst.sci",%F,%F);
my_function_str = ["function c=bug_1966_tst(a,b)"; ..
                   "  c = a + b;"; ..
                   "endfunction"];

mkdir(my_dir);

mputl(my_function_str,my_file);

if execstr("getd(my_dir);","errcatch")   <> 0 then pause,end
cd(my_dir);
if execstr("getd(pwd());","errcatch") <> 0 then pause,end
