// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//<-- CLI SHELL MODE -->
//<-- INTERACTIVE TEST -->
// <-- Non-regression test for bug 14041 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14041
//
// <-- Short Description -->
// genlib crashes if one file is a symbolic link created by emacs to lock currently edited file

// create a directory  (ie: dir_genlib)
// put in this directory a file wich contain the next script
function genlibtest()
    disp("genlibtest")
endfunction

// then open this file (with emacs), modify the function but not save the file

// start scilab
// go to the path of the created directory
// execute in scilab

genlib("genlibtest", "dir_genlib", %t ,%t)

// this execution have to return an error : genlib: Cannot open file ''mylib//.#mylib.sci''.
// instead of crash
