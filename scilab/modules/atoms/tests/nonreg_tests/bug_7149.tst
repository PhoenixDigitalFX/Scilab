// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Pierre MARECHAL
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH ATOMS -->
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 7149 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7149
//
// <-- Short Description -->
// For a wrong formatted toolbox list ATOMS doesn't report the error and crashes.
// Please change line 169 of the file modules\atoms\macros\atoms_internalsatomsDESCRIPTIONread.sci from:
// error(msprintf(gettext("%s: The file ""%s"" is not well formatted at line %d\n"),"atomsDESCRIPTIONread",filein,i));
// to:
// error(msprintf(gettext("%s: The file ""%s"" is not well formatted at line %d\n"),"atomsDESCRIPTIONread",file_in,i));

load(SCI+"/modules/atoms/macros/atoms_internals/lib");
mputl("abcdef",TMPDIR+"/DESCRIPTION");
execstr("atomsDESCRIPTIONread(TMPDIR+""/DESCRIPTION"");","errcatch");
if lasterror() <> msprintf(gettext("%s: The file ''%s'' is not well formatted at line %d\n"),"atomsDESCRIPTIONread",TMPDIR+"/DESCRIPTION",1) then pause, end
