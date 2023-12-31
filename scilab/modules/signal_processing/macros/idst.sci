// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA - 2012 - S. Steer
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.
function x=idst(a,varargin)
    if type(a)==1 then
        x=dst(a,1,varargin(:))
    else
        error(msprintf(_("%s: Wrong type for input argument #%d: Array of double expected.\n"),"idst", 1));
    end
endfunction
