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

function [tree]=sci_MFUN(tree)
    // Prototype for *int**()
    // M2SCI function
    // Conversion function for Matlab MFUN()
    // Input: tree = Matlab funcall tree
    // Output: tree = Scilab equivalent for tree
    // Emulation function: mtlb_MFUN()

    // %c_MFUN and %b_MFUN are not defined in Scilab
    x = getrhs(tree)

    // Matlab MFUN() can return Boolean type value
    if or(x.vtype==[Boolean,Unknown]) then
        vtype = Unknown
    else
        vtype = Int
    end

    x = convert2double(x)

    tree.rhs = Rhs_tlist(x)

    if is_complex(x) then
        set_infos(msprintf(gettext("Scilab %s() does not work with Complex values: %s() call IGNORED."),"MFUN","MFUN"),2);
        if typeof(x)=="operation" then
            x.out = tree.lhs
        elseif typeof(x)=="funcall" then
            x.lhs = tree.lhs
        end
        tree = x

    elseif ~is_real(x) then
        set_infos(msprintf(gettext("Scilab %s() does not work with Complex values: %s() call IGNORED."),"MFUN","MFUN"),2);
        repl_poss(x,tree,x,gettext("is Real."))
        if typeof(x)=="operation" then
            x.out = tree.lhs
        elseif typeof(x)=="funcall" then
            x.lhs = tree.lhs
        end
        tree = x

    else
        tree.name = "mtlb_MFUN"
        tree.lhs(1).dims = x.dims
        tree.lhs(1).type = x.type
    end

endfunction
