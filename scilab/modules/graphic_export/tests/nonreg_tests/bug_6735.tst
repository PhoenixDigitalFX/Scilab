// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- INTERACTIVE TEST -->

// <-- Non-regression test for bug 6735 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6735
//
// <-- Short Description -->
// The "landscape" option in the print dialog as well as in xs2eps does
// not work as expected.

plot2d();
xs2eps(0, 'export.eps', 'landscape');
