//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 1956 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1956
//
// <-- Short Description -->
//    this works for example:
//    a=10; // a constant
//    for i=1:2
//     d(i)=a;
//    end
//    but it doesn't work if 'a' is a structure.
//    I find a solution for a structure:
//    a.b=[1 2 3];
//    a.c=[4 5 6]
//    but it's not smart and clear code...

clear a d
a.b  = [1 2 3];
d(1) = a;
if or(d<>a) then pause,end

d(2)=a;
if or(d(1)<>a) then pause,end
if or(d(2)<>a) then pause,end
