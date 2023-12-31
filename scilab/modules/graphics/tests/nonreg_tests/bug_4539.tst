// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - Digiteo - Yann Collette
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 4539 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4539
//
// <-- Short Description -->
// Some optional parameters were not set in some case
// 

A=rand(10,10);
b=[linspace(1,10,11)];
c=[linspace(10,20,11)];
bar3d(list(A,b,c),leg="A@b@c");

// should not display any warning or error

