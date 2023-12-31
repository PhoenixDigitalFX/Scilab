// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2453 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2453
//
// <-- Short Description -->
//    mfscanf and probably the other variants msscanf mscanf may crash Scilab when
//    first argument is -1 (any number of lines)

fd = mopen(SCI+'/modules/fileio/tests/nonreg_tests/bug_2453.dat','r');
Lx = mfscanf(-1,fd,'%g %g\n');
mclose(fd);

if size(Lx,1)<>999 then pause,end
