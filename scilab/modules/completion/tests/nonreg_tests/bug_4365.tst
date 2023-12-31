// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4365 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4365
//
// <-- Short Description -->
// completion fails and returns a bad value if we try to use it on a path that doesn't exist 
// cd SCI/modules/arnoldi/nonreg_tes[TAB]


// <-- CLI SHELL MODE -->

ilib_verbose(0);
ierr = exec(SCI+"/modules/completion/tests/utilities/build_primitives.sce","errcatch",-1);
if ierr<>0 then pause, end
ierr = exec(TMPDIR + "/completion/loader.sce","errcatch",-1);
if ierr<>0 then pause, end

currentline = 'cd SCI/modules/arnoldi/nonreg_tes';
r = completeline(currentline,'nonreg_test_run',getfilepartlevel(currentline),getpartlevel(currentline),%f);
if r <> currentline then pause,end

currentline = 'cd modules/arnoldi/src/c';
r = completeline(currentline,'c/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd modules/arnoldi/src/c/' then pause,end

currentline = 'cd reposit';
r = completeline(currentline,'repositories/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/' then pause,end

currentline = 'cd repositories/';
r = completeline(currentline,'tooboxes_google/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/tooboxes_google/' then pause,end

currentline = 'cd repositories/to';
r = completeline(currentline,'tooboxes_google/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/tooboxes_google/' then pause,end

currentline = 'cd repositories/tooboxes_google';
r = completeline(currentline,'tooboxes_google/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/tooboxes_google/' then pause,end

currentline = 'cd repositories/tooboxes_google/sci';
r = completeline(currentline,'scicoinor/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/tooboxes_google/scicoinor/' then pause,end

currentline = 'cd repositories/tooboxes_google/scicoinor/sci';
r = completeline(currentline,'sci_gateway/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/tooboxes_google/scicoinor/sci_gateway/' then pause,end

currentline = 'cd repositories/tooboxes_google/scicoinor/';
r = completeline(currentline,'sci_gateway/',getfilepartlevel(currentline),getpartlevel(currentline),%t);
if r <> 'cd repositories/tooboxes_google/scicoinor/sci_gateway/' then pause,end
