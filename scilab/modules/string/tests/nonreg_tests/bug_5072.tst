// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- Non-regression test for bug 5072 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/5072
//
// <-- Short Description -->
// strspn("aéio","éa") returns 3 instead of 2

//======================================================================================== 
ref = 2;
res = strspn("aéio","éa");
if ref <> res then pause,end
//======================================================================================== 


