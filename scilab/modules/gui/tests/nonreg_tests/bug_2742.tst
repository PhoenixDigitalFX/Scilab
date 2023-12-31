// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 2742 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2742
//
// <-- Short Description -->
//    edit uicontrols do not support callbacks

// Callback on edit uicontrols available thanks Java version of uicontrols
// Callback is executed when the edit looses focus or the user hits ENTER or TAB 

h=uicontrol("style","edit");

set(h,"callback","disp(""You entered ""+ get(h,""string""))");