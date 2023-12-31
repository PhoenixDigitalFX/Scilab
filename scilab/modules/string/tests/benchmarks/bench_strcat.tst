// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//==============================================================================
// Benchmark for strcat function
//==============================================================================

text = mgetl(SCI+"/modules/string/tests/benchmarks/ascii_text.txt");

// <-- BENCH START -->
a = strcat(text);
// <-- BENCH END -->

