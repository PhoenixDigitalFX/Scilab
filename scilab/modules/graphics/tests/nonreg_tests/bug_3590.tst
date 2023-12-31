// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 3590 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3590
//
// <-- Short Description -->
// Error message when we want to see a figure which has as userdata a structure (struct).
//

userdata = struct("dd",2);
h=figure();
set(h,"user_data",userdata);
if execstr("disp(h.user_data)","errcatch")<>0 then pause; end
