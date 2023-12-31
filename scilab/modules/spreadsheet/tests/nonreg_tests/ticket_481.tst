// =============================================================================
// Copyright (C) 2010 - 2012 - INRIA - Allan CORNET
// =============================================================================
// <-- CLI SHELL MODE -->
// =============================================================================
// <-- Non-regression test for bug 481 -->
//
// <-- Short Description -->
// csvRead crashed Scilab, if there were negative values in file.
// =============================================================================
path = SCI+"/modules/spreadsheet/tests/unit_tests/";

neg = [ -1 -2 -3; -4 -5 -6; -7 -8 -9];

// Write to file
negFile = fullfile(TMPDIR,"neg.csv");
csvWrite (neg , negFile);

// Read from file
n = csvRead(negFile);

assert_checkequal(n, neg);
// =============================================================================

