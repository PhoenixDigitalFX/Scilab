// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 7223 -->
// <-- TEST WITH GRAPHIC -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7223
//
// <-- Short Description -->
// unsetmenu(gettext("&Applications"), 4) crashed Scilab

scf(1);
plot3d();

for i = 1:20
  unsetmenu(1, gettext("&Edit"), i);
end
