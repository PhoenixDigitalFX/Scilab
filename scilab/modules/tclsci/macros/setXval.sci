// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

// Rectangle data
function setXval(val)
    global ged_handle; h=ged_handle
    tmp=h.data;
    tmp(1)=val;
    tst=execstr("h.data=tmp","errcatch","n");
    if tst<>0 then
        disp "Warning: Y data must contain double"
    end
endfunction
