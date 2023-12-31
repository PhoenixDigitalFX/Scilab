//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 768 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/768
//
// <-- Short Description -->
//    as on Scilab 2.7.2, the "window" function still has a bug 
//    when choosing the "chebychev" type with its corresponding 
//    parameter vector. SAys the parameters are out of bounds 
//    whereas it is wrong

msgerr = msprintf(gettext("%s: Wrong value for input argument #%d: incorrect element #%d\n"), "window", 3, 2);
assert_checkerror ( "window(''ch'',128,[0.25 0.1])" , msgerr);