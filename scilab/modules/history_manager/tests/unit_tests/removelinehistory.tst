//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Simon MARCHETTO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

function [] = check_history(expected)
  actual = gethistory();
  // ignore first line of history which indicates the current session
  actual(1,1) = []
  assert_checkequal(actual, expected);
endfunction

// checking removing simple lines

resethistory()
// warning: a session line will be added at the front of this history
addhistory("lineA");
addhistory("lineB");
addhistory("lineC");
addhistory("lineD");

removelinehistory(1);
check_history(['lineB';'lineC';'lineD']);

removelinehistory(2);
h = gethistory();
check_history(['lineB';'lineD']);

removelinehistory(2);
h = gethistory();
check_history(['lineB']);

removelinehistory(1);
check_history([]);

// check removing of session lines

resethistory()
// warning: a session line will be added at the front of this history
expected_history = ["// -- 26/02/2013 10:00:00 -- //";
                    "lineA";
                    "lineB";
                    "// -- 26/02/2013 11:00:00 -- //";
                    "lineC";
                    "// -- 26/02/2013 12:00:00 -- //";
                    "// -- 26/02/2013 13:00:00 -- //"];
addhistory(expected_history);

removelinehistory(1);
expected_history(1:3,1) = [];
check_history(expected_history);

removelinehistory(3);
expected_history(3,1) = [];
check_history(expected_history);

removelinehistory(3);
expected_history(3,1) = [];
check_history(expected_history);

removelinehistory(1);
expected_history(1:2,1) = [];
check_history(expected_history);

// check error messages

resethistory()
ierr = execstr("removelinehistory(10)", "errcatch");
assert_checkequal(ierr, 999);

