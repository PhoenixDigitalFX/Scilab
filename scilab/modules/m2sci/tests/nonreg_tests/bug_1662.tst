// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005 - INRIA - Farid BELAHCENE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->
// <-- NOT FIXED -->  6.0.0 -> 6.1.0
//
// <-- Non-regression test for bug 1662 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1662
//
// <-- Short Description -->
//    when converting Matlab switch case statements to Scilab select case
//    statements using m2sci_syntax , if there is a comment line between the
//    switch and case statement in the m file, the sytnax is rejected with an
//    incorrect syntax error. Take the comment out and it works fine. Not a
//    major problem but a slight nuisance

MFILECONTENTS=[
        "function  y=bug1662(x)";
        "switch x % comment1";
        "% comment2";
        "case x>0 then y=''positive''";
        "case x<0 then y=''negative''";
        "else y=''null''";
        "end"
        ];

MFILE=TMPDIR+"/bug1662.m"
SCIFILE=TMPDIR+"/bug1662.sci"

mputl(MFILECONTENTS,MFILE);
mfile2sci(MFILE,TMPDIR,%f,%t);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=[
        "function [y] = bug1662(x)"
        ""
        "// Output variables initialisation (not found in input variables)"
        "y=[];"
        ""
        "select x // comment1"
        " // comment2";
        "  case mtlb_logic(x,"">"",0) then"
        "    y = ""positive"""
        "  case mtlb_logic(x,""<"",0) then"
        "    y = ""negative"""
        "  else y = ""null"""
        "end;"
        "endfunction"
        ];

assert_checkequal(SCIFILECONTENTSREF, SCIFILECONTENTS);
