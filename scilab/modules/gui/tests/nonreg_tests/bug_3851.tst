// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//
// <-- Non-regression test for bug 3851 -->
//

//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3851
//
// <-- Short Description -->
// root_properties: get(0, <property>) works only for
// "screensize_px" and "screendepth" properties. All other
// properties presented in the help file yield to an error.


ierr = execstr('r = get(0, ""screendepth"")', 'errcatch');
if ierr <> 0 then pause,end

ierr = execstr('r = get(0, ""screensize_px"")', 'errcatch');
if ierr <> 0 then pause,end

ierr = execstr('r = get(0, ""screensize_pt"")', 'errcatch');
if ierr <> 0 then pause,end

ierr = execstr('r = get(0, ""screensize_mm"")', 'errcatch');
if ierr <> 0 then pause,end

ierr = execstr('r = get(0, ""screensize_cm"")', 'errcatch');
if ierr <> 0 then pause,end

ierr = execstr('r = get(0, ""screensize_in"")', 'errcatch');
if ierr <> 0 then pause,end

ierr = execstr('r = get(0, ""screensize_norm"")', 'errcatch');
if ierr <> 0 then pause,end

