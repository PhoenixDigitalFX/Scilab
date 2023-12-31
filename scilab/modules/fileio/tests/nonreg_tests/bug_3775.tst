// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
//<-- CLI SHELL MODE -->
// <-- Non-regression test for bug 3775 -->
//

// <-- Short Description -->
//There is no way to know if the path returned by get_absolute_file_path() is the good one or not :
//if the input argument is not an opened file, the current directory is returned.
//=> It should return an error instead of just printing a message.

//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3775
//

a=mopen(TMPDIR+filesep()+"test.sce","wt");
path_returned = get_absolute_file_path("test.sce");
if (path_returned <> TMPDIR+filesep()) then pause,end
mclose(a);

ierr = execstr("path_returned = get_absolute_file_path(''test.sce'');","errcatch");
if ierr <> 999 then pause,end
