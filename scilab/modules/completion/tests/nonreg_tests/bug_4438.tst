// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4838 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4838
//
// <-- Short Description -->
// bug in the completion (insertion)
// load(SCIH[TAB]/macros)

// <-- CLI SHELL MODE -->

ilib_verbose(0);
ierr = exec(SCI+"/modules/completion/tests/utilities/build_primitives.sce","errcatch",-1);
if ierr<>0 then pause, end
ierr = exec(TMPDIR + "/completion/loader.sce","errcatch",-1);
if ierr<>0 then pause, end


currentline = 'load(SCIH';
r = completeline(currentline,'SCIHOME',getfilepartlevel(currentline),getpartlevel(currentline),%t,'/modules)');
if r <> 'load(SCIHOME/modules)' then pause,end
