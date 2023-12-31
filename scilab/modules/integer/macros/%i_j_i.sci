// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA -
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.


function r=%i_j_i(a,n)
    if or(n<0) then
        r=double(a).^double(n)
    else
        if size(a,"*")==1 then
            r=iconvert(double(a).^double(n),inttype(a))
        else
            if size(n,"*")<>1 then
                msg = _("%s: Non implemented feature.\n");
                error(msprintf(msg, "%i_j_i"))
            else
                n=double(n)
                r=a
                for i=2:n,r=r.*a,end
            end
        end
    end
endfunction
