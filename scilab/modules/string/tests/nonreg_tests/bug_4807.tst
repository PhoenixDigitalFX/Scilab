// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 4807 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4807
//
// <-- Short Description -->
//strsubst does not check if second argument is a valid pattern when there is 'r' as
// fourth argument
//========================================================================================
ierr = execstr("strsubst(''pattern -- pattern __ pattern '',''pattern'',''replace'',''r'');","errcatch");
if ierr <> 999 then pause,end

ierr = execstr("strsubst(''pattern -- pattern __ pattern '',''/pattern/'',''replace'',''r'');","errcatch");
if ierr <> 0 then pause,end
