// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- Non-regression test for bug 5659 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/5659
//
// <-- Short Description -->
// emptystr changed the value of an input variable.

//======================================================================================== 
a = 3;
b = emptystr();
if b <> '' then pause,end
if a <> 3 then pause,end
//======================================================================================== 
a = 3;
b = emptystr(a);
if a <> 3 then pause,end
//======================================================================================== 
a = 3;
b = 2;
c = emptystr(a, b);
if a <> 3 then pause,end
if b <> 2 then pause,end
//======================================================================================== 
a = 3;
c = emptystr(a, a);
if a <> 3 then pause,end
//======================================================================================== 
