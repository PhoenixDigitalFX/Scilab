// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
// Copyright (C) 2018 - Samuel GOUGEON
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function r = %s_s_ip(s,ip)
    // s-ip
    if size(s,"*")<>1 then
        msg = _("%s: Argument #%d: Scalar (1 element) expected.\n")
        error(msprintf(msg, "%s_s_ip", 1))
    end
    r = (s-ip(1)):-ip(2):(s-ip(3))
endfunction
