// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2018 - UTC - Stéphane MOTTELET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 15552 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/15552
//
// <-- Short Description -->
// An appended comment // after a comma in an multiline literal array now generates an error (regression)

a = [ 1, // line #1
      2 ]

a = [
  1, // line #1
  2]

a = [
  1 // line #1
  2, // line #2
  ]
