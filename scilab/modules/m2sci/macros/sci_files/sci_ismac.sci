// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2020 - Samuel GOUGEON
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function tree = sci_ismac(tree)
    // M2SCI converter for for Matlab ismac()

    OS = Funcall("getos",1,list())
    tree = Operation("==", list(OS,Cste("Darwin")),tree.lhs)

    tree.out(1).dims = list(1,1)
    tree.out(1).type = Type(Boolean,Boolean)

endfunction
