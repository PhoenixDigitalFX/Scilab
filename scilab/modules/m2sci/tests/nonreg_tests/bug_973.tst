// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Vincent COUVERT <vincent.couvert@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 973 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/973
//
// <-- Short Description -->
//    matlab file conversion problem (apparently: Extraction of
//    out from 'funcall' tlist is not yet implemented)

MFILECONTENTS = [
    "%m2scideclare var|? ?|?"
    "% comment"
    "var1 = strrep(var,'' '','','')"
    ];

MFILE=TMPDIR+"/bug973.m";
SCIFILE=TMPDIR+"/bug973.sci";

fd=mopen(MFILE,"w");
mputl(MFILECONTENTS,fd);
mclose(fd);

mfile2sci(MFILE,TMPDIR);

fd=mopen(SCIFILE,"r");
SCIFILECONTENTS=mgetl(fd,-1);
mclose(fd);

SCIFILECONTENTSREF=[
    ""
    ""
    "// comment"
    "var1 = mtlb_strrep(var,"" "","","")"
    ];

assert_checkequal(SCIFILECONTENTSREF, SCIFILECONTENTS);

