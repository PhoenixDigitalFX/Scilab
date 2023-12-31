//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 546 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/546
//
// <-- Short Description -->
//    Bug Report Id: 031202003109143249
//    Wasn't also this fixed?
//    On Scilab CVS with " > with int " function
//    The Error Messages are:
//     none but wrong result
//    Commands: int8(ones(10,10))>2
//     ans  =
//
//    ! T T T T F F F F F F !
//    ! T T T T F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//    ! T T T F F F F F F F !
//
//    Enrico SEGRE on Linux version RH9 distribution  with   as window manager
// ...

//exec("bug546.sci")

a=int8(ones(10,10))>2;

b = [ 	%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
				%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ];

if or(a <> b) then pause,end
