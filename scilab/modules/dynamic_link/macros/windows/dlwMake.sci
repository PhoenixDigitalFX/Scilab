// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) DIGITEO - 2010 - Allan CORNET
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.
//=============================================================================
function res = dlwMake(files, objects_or_dll)

    if ~haveacompiler() then
        error(msprintf(gettext("%s: A Fortran or C compiler is required.\n"), "G_make"))
    end

    [lhs,rhs] = argn(0);
    if rhs <> 2 then
        error(msprintf(gettext("%s: Wrong number of input argument(s).\n"), "G_make"));
    end

    msg = "";

    if typeof(objects_or_dll)<>"string" then
        error(sprintf(gettext("%s: Wrong type for input argument #%d: String expected."), "G_make", 2));
    end

    OBJ = "";
    [ptmp, ftmp, fext] = fileparts(objects_or_dll);
    OBJ = ptmp + ftmp;

    //create a scibuild.bat file in TMPDIR directory
    cmd = "nmake /Y /nologo /f Makefile.mak " + OBJ;
    scibuildfile = dlwWriteBatchFile(cmd);
    if ilib_verbose() > 1 then
        msg = unix_g(scibuildfile);
        disp(msg);
    else
        host(scibuildfile);
    end

    deletefile(scibuildfile);
    res = [OBJ];

endfunction
