// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->
// <-- CLI SHELL MODE -->

// test set/get ilib_verbose

ref = 1; // default value
r = ilib_verbose();
if r <> ref then pause,end

ierr = execstr('ilib_verbose([1 2]);','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('ilib_verbose(''foo'');','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('ilib_verbose(54);','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('ilib_verbose(5.4);','errcatch');
if ierr <> 999 then pause,end

ref = 0;
ilib_verbose(ref)
r = ilib_verbose();
if r <> ref then pause,end

ref = 1;
ilib_verbose(ref)
r = ilib_verbose();
if r <> ref then pause,end

ref = 2;
ilib_verbose(ref)
r = ilib_verbose();
if r <> ref then pause,end

