// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 7242 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7242
//
// <-- Short Description -->
// Check name is already used by a variable 
// or un function ( built-in or macro )

BUGNAME = "bug_11093";
ilib_verbose(0);
if haveacompiler() then
    cd TMPDIR;
    mkdir(BUGNAME);
    cd(BUGNAME);
    DEST = TMPDIR + "/" + BUGNAME + "/" + BUGNAME + ".c";
    copyfile(SCI + "/modules/api_scilab/tests/nonreg_tests/" + BUGNAME + ".c", DEST);
    assert_checkequal(isfile(DEST), %T);
    
    gw_functions = [BUGNAME, "sci_" + BUGNAME];

    ilib_build("lib" + BUGNAME, gw_functions, BUGNAME + ".c", []);
    exec loader.sce;
    execstr("a = " + BUGNAME + "(""cos"")", "errcatch");
    assert_checktrue(a);
    execstr("b = " + BUGNAME + "(""myFunctionThatNotExist"")", "errcatch");
    assert_checkfalse(b);
end