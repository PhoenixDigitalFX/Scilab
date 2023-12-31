// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2002-2004 - INRIA - Vincent COUVERT
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function tree=sci_csch(tree)
    // M2SCI function
    // Conversion function for Matlab csch()
    // Input: tree = Matlab funcall tree
    // Ouput: tree = Scilab equivalent for tree

    X=getrhs(tree)
    X=convert2double(X)

    sinh_funcall=Funcall("sinh",1,list(X),list())
    tree=Operation("./",list(Cste(1),sinh_funcall),tree.lhs)

    tree.out(1).dims=X.dims
    tree.out(1).type=Type(Double,X.property)
endfunction
