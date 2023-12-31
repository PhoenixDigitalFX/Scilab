// =============================================================================
// Copyright (C) 2010 - 2012 - INRIA - Allan CORNET
// =============================================================================
// <-- CLI SHELL MODE -->
// =============================================================================
// <-- Non-regression test for bug 644 -->
//
// <-- Short Description -->
// csvRead did not support empty fields
// =============================================================================
REF_str_m = ['1','','3';'4','5','6'];
csvWrite(REF_str_m, TMPDIR + "/ticket_644.csv");
str_m = csvRead(TMPDIR + "/ticket_644.csv", [], [], "string");
assert_checkequal(str_m, REF_str_m);

REF_str_m = ['','2','3';'4','5','6'];
csvWrite(REF_str_m, TMPDIR + "/ticket_644.csv");
str_m = csvRead(TMPDIR + "/ticket_644.csv", [], [], "string");
assert_checkequal(str_m, REF_str_m);


REF_str_m = ['','2','3';'4','','6'];
csvWrite(REF_str_m, TMPDIR + "/ticket_644.csv");
str_m = csvRead(TMPDIR + "/ticket_644.csv", [], [], "string");
assert_checkequal(str_m, REF_str_m);


REF_str_m = ['1','2','3','';'4','5','',''];
str_m = csvRead(SCI+"/modules/spreadsheet/" + "tests/nonreg_tests/ticket_644.csv", [], [], "string");
assert_checkequal(str_m, REF_str_m);
// =============================================================================

