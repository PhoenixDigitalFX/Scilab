// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 3177 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3177
//
// <-- Short Description -->
// nax subticks wrong
//

plot2d(0:2:180,0:90,rect=[0,0,190,100],nax=[1,20,1,11]);

// should be one subticks on each axis
axes = gca();
if (axes.sub_ticks <> [1, 1]) then pause; end



