
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) DIGITEO - 2010-2011 - Allan CORNET
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
function [make_command, lib_name_make, lib_name, path, makename, files] = ..
    dlwGetParamsIlibCompil(lib_name, files)

    path="";
    lib_name = lib_name + getdynlibext();
    lib_name_make = lib_name;
    makename = dlwGetDefltMakefileName() + dlwGetMakefileExt() ;
    make_command = "nmake /Y /nologo /f ";

endfunction
//=============================================================================
