// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- INTERACTIVE TEST -->

// Check support to UTF-8 file names
// ---------------------------------
tab_ref = [ ..
"世界您好", ..
"азеазея", ..
"ハロー・ワールド", ..
"เฮลโลเวิลด์", ..
"حريات وحقوق", ..
"프로그램", ..
"프로그램", ..
"תוכנית"];

cd TMPDIR;
mkdir TCL_tests;
cd TCL_tests;

origfile = SCI + "/modules/tclsci/demos/tk/puzzle";

for i = 1 : size(tab_ref, "*")
    newfile = tab_ref(i);
    copyfile(origfile, newfile);
    TCL_EvalFile(newfile);
    sleep(3)
    // the puzzle must be displayed correctly for any source filename
end

cd TMPDIR
removedir TCL_tests;
