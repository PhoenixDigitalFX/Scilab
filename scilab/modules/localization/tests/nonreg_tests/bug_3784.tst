//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3784 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3784
//
// <-- Short Description -->
//    When Scilab is launched in French, bad read of the values
// <-- FRENCH IMPOSED -->

a=read(SCI+"/modules/graphics/demos/anim/anim6/yt.wrt",20,201);
if (a(1,2) == - 7.) then pause, end
