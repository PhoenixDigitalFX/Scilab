// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 2183 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2183
//
// <-- Short Description -->
//    The content typed into an 'edit' uicontrol cannot be retrieved if initially unset


f = figure(1);

// Create the uicontrol
h=uicontrol(f,"style","edit","position",[20 20 80 20]);

// Now type something in the entry box

if execstr("get(h,""string"")", "errcatch")<>0 then pause; end

