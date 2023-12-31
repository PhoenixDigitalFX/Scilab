// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Pierre Lando
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 7505 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7505
//
// <-- Short Description -->
// Last optional parameter of "legend" macros was not readed.


scf(42);
ierr=execstr("plot(), legend(''blabla'',''blabla'',4);", "errcatch");
if ierr<>0 then pause, end;
