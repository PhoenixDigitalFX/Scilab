// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ???? - INRIA - Scilab
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function op = %s_i_operation(field, cste, op)
    if field=="vtype" then
        op.type.vtype = cste
    elseif field=="property" then
        op.type.property = cste
    else
        error(gettext("Not yet implemented."))
    end
endfunction
