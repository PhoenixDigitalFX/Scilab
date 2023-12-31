//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 12285 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12285
//
// <-- Short Description -->
//
// save function could not handle any matrix in append mode.

function checknoerror(str)
    err = execstr(str, "errcatch");
    assert_checktrue(err == 0);
endfunction

savefile = TMPDIR + "/bug_12285.sod";
a_list = list(1,2,3);
a_list_ref = a_list;

a_string = "a string";
a_string_ref = a_string;

an_integer = 546;
an_integer_ref = an_integer;

a_complex_num = 1 + %i;
a_complex_num_ref = a_complex_num;

an_array_multidim  = [1 2 3 4; 5 6 7 8; 9 10 11 12];
an_array_multidim_ref = an_array_multidim;

//save all variables in the same file
err = execstr("save(savefile, ""a_list"", ""-append"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("save(savefile, ""a_string"", ""-append"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("save(savefile, ""an_integer"", ""-append"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("save(savefile, ""a_complex_num"", ""-append"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("save(savefile, ""an_array_multidim"", ""-append"")", "errcatch");
assert_checktrue(err == 0);

//clear variables
clear a_list a_string an_integer an_array_multidim

//load variables
err = execstr("load(savefile, ""a_list"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("load(savefile, ""a_string"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("load(savefile, ""an_integer"")", "errcatch");;
assert_checktrue(err == 0);
err = execstr("load(savefile, ""a_complex_num"")", "errcatch");
assert_checktrue(err == 0);
err = execstr("load(savefile, ""an_array_multidim"")", "errcatch");
assert_checktrue(err == 0);

//check variables values
assert_checkequal(a_list, a_list_ref);
assert_checkequal(a_string, a_string_ref);
assert_checkequal(an_integer, an_integer_ref);
assert_checkequal(a_complex_num, a_complex_num_ref);
assert_checkequal(an_array_multidim, an_array_multidim_ref);

//append file with a already existing variable name but different data
a_list = "ok ok i am not a list";
a_list_ref = a_list;
err = execstr("save(savefile, ""a_list"", ""-append"")", "errcatch");
assert_checktrue(err == 0);
clear a_list
err = execstr("load(savefile, ""a_list"")", "errcatch");
assert_checktrue(err == 0);
assert_checkequal(a_list, a_list_ref);
