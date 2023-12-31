// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- INTERACTIVE TEST -->

// <-- Non-regression test for bug 3349 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3349
//
// <-- Short Description -->
// getcolor() freezes Scilab.

getcolor()

// close the new window using the closing cross.
// It used to freeze Scilab.
