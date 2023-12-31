//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 1568 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1568
//
// <-- Short Description -->
//    The random number generator grand() does not always produce the same 
//    result starting from the same seed, as shown by the following 
//    transcript of a Scilab session:
//
//    $ scilab -nw
//            -------------------------------------------
//                             scilab-3.1.1
//
//                      Copyright (c) 1989-2005
//                  Consortium Scilab (INRIA, ENPC)
//            -------------------------------------------
//
//
//    Startup execution:
//      loading initial environment
//
//    -->grand('setsd',12)
//
//    -->grand(1,'prm',[1:5]')
//     ans  =
// ...

grand('setsd',12);
A = grand(1,'prm',[1:5]');
grand('setsd',12);
B = grand(1,'prm',[1:5]');

if or(A<>B) then pause,end
