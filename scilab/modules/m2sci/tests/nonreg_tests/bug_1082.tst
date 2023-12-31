// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005 - INRIA - Farid BELAHCENE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 1082 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1082
//
// <-- Short Description -->
//    Error during conversion of a very simple file. Though the
//    syntax is the same in both languages, the converter fails to
//    convert the rounding of the field of a structure: "round(a.b)"

MFILECONTENTS=["structure.field = 2;"
""
"data = round(structure.field);"];

MFILE=TMPDIR+"/bug1082.m";
SCIFILE=TMPDIR+"/bug1082.sci";

mputl(MFILECONTENTS,MFILE);

mfile2sci(MFILE,TMPDIR,,%T);
SCIFILECONTENTS=mgetl(SCIFILE);

SCIFILECONTENTSREF=[
    ""
    "structure.field = 2;"
    ""
    "data = round(structure.field);"];

if or(SCIFILECONTENTSREF<>SCIFILECONTENTS) then pause,end
