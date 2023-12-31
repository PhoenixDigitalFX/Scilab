// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 487 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/487
//
// <-- Short Description -->
//    Bug Report Id: 12195200378121313
//      According to the manual of "contour2d" a vector instead of a scalar should also be possible for the level values of the contourplot. But scilab-2.7 gives me an error.
//
//    I must admit that I am not an experienced user concerning scilab. Maybe I have someting overseen, but I don't known what.
//
//    Could you please help me?
//
//    On Scilab 2.7 with " contour2d " function
//    The Error Messages are:
//       !--error   204 
//    Argument   2, wrong type argument: expecting a scalar
//    at line       3 of function contour2d                called by :  
//        contour2d(rhogit,zgit,Jv, lvl, strf="041");
//
//    Commands: lvl in contour2d is a vector
//
//    lvl= -0.0003 + (1:10)*(0.0003-(-0.0003))/(10+1)
//
//
//    Kappen on Linux version 2.4 distribution Debian woody with  gnome1.4 Sawfish as window manager
// ...

lvl = -0.0003 + (1:10)*(0.0003-(-0.0003))/(10+1);

if execstr("contour2d(1:10,1:10,rand(10,10),lvl,rect=[0,0,11,11])","errcatch","n")<>0 then pause,end
close()
