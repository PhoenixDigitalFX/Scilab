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

function B=mtlb_cumprod(A,dim)
    // Emulation function for Matlab cumprod()

    [lhs,rhs]=argn()

    if rhs==1 then
        if size(a,1)==1|size(a,2)==1 then
            r=cumprod(a)
        else
            r=cumprod(a,firstnonsingleton(A))
        end
    else
        if dim<=size(size(A),"*") then
            B=cumprod(A,dim)
        else
            B=A
        end
    end
endfunction
