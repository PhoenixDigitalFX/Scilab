// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13213 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13213
//
// <-- Short Description -->
// User defined margins were reset by auto computation of the margins

ax=newaxes();
ax.margins=[0 0 0 0];
ax.x_label.visible="off";

assert_checkequal(ax.margins, [0 0 0 0]);