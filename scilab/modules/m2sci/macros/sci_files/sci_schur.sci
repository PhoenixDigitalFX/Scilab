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

function [tree]=sci_schur(tree)
    // M2SCI function
    // Conversion function for Matlab schur()
    // Input: tree = Matlab funcall tree
    // Ouput: tree = Scilab equivalent for tree

    A = getrhs(tree)
    // %c_schur and %b_schur are not defined
    A = convert2double(A)
    tree.rhs=Rhs_tlist(A)

    tree.lhs(1).dims=A.dims
    tree.lhs(1).type=A.type

    if lhs==2 then
        tree.lhs(2).dims=A.dims
        tree.lhs(2).type=A.type
    end
endfunction
