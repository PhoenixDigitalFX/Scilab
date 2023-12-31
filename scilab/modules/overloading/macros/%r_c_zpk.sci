// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C)  2016 - INRIA - Serge Steer
//
// This file is licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// For more information, see the COPYING file which you should have received
// along with this program.
function b=%r_c_zpk(a,b)
    if a.dt<>b.dt then
        error(msprintf(_("%s: time domains are not compatible.\n"),"[a,b]"))
    end
    [ma,na]=size(a)
    if size(b,1)<>ma then
        error(msprintf(_("%s: Incompatible input arguments #%d and #%d: Same number of rows expected.\n"),"[]",1,2))
    end
    b=[zpk(a) b]
endfunction
