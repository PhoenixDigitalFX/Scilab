// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 2577 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2577
//
// <-- Short Description -->
// reference (for immediate display on the shell) to an invalid graphic handle
// opens an empty graphic window, if there is none open,
// besides giving the right error
// 

close(winsid())
h=scf(0);
delete(h);

// a call to h should not open a window
if is_handle_valid(h)<>%f then pause,end;

// no window should have been created
if (winsid() <> []) then pause; end

