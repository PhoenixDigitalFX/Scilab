// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2322 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2322
//
// <-- Short Description -->
//    emptystr(0,1) returns an empty matrix of size 0 x 1 which is not coherent with
//    current empty matrix managment.

if or(size(emptystr(0,1))<>[0 0]) then pause,end
if or(size(emptystr(1,0))<>[0 0]) then pause,end
if or(size(emptystr(0,3))<>[0 0]) then pause,end
if or(size(emptystr(5,0))<>[0 0]) then pause,end
if or(size(emptystr(0,0))<>[0 0]) then pause,end
if or(size(emptystr(3,5))<>[3 5]) then pause,end
