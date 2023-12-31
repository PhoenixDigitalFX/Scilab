//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 12111 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12111
//
// <-- Short Description -->
// karmarkar does not generate appropriate warnings
//
// <-- ENGLISH IMPOSED -->

A=[-0.1548 -0.0909 -0.0014 -0.0001; 0.0989 -0.0884 0.0004 0];
B=[0.1966354; 0.2167484];
C=[0.2056; 0.0908; 0.0012; 0];
lb=[0; 0; 0; 0];
ub=[1; 1; 1; 1];
assert_checktrue(execstr("xopt=karmarkar([],[],C,[],[],[],[],[],A,B,lb,ub)","errcatch")==0);
