// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Pierre-Aime Agnel
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 12170 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12170
//
// <-- Short Description -->
// matfile_open with option "w" causes matfile_listvar error


A = rand(10,10);
B = sprand(100,100,0.1);
C = "foo";
D = "bar";

filename=TMPDIR+"/test_matfile.mat";
savematfile(filename,"A","B","C","D","-v6");

clear();

filename=TMPDIR+"/test_matfile.mat";
//Open files in different modes
fd = matfile_open(filename, "w");

//Checking if matfile_listvar generates an error on a "w" opened file
if execstr("[name, classes, types]=matfile_listvar(fd)","errcatch","n")<>0
    genErr = %t; //matfile_listvar generated an error
else
    genErr = %f; //matfile_listvar did not generate an error
end

assert_checkfalse(genErr);
assert_checkequal(matfile_close(fd), %t);

//Listvar on an empty file should not give error but empty matrices
assert_checktrue(isempty(name));
assert_checktrue(isempty(classes));
assert_checktrue(isempty(types));
