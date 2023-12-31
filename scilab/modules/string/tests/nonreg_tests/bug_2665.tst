// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Pierre MARECHAL <pierre .marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2665 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2665
//
// <-- Short Description -->
// The example provided with the on-line help of grep crashes Scilab
// grep('2' ,'/2(]*)?$\1/' ,'r')
//

if grep("2" ,"/2(]*)?$\1/" ,"r")       <> 1      then pause, end
if or( regexp("xabyabbbz","/ab*/")     <> [2 5]) then pause, end
if strindex("2","/2(]*)?$\1/" ,"r")    <> 1      then pause, end
