// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function [s] = %lss_f_lss(s1,s2)
    //  s = [s1;s2] in state-space

    [s1,s2] = sysconv(s1,s2)
    [a1,b1,c1,d1,x1,dom1] = s1(2:7)
    [a2,b2,c2,d2,x2] = s2(2:6)
    [n1,n1] = size(a1);
    [n2,n2] = size(a2)
    [p1,m1] = size(d1);
    [p2,m2] = size(d2)
    a1=[a1, zeros(n1,n2); zeros(n2,n1), a2]
    c1=[c1, zeros(p1,n2); zeros(p2,n1), c2]
    s=tlist(["lss","A","B","C","D","X0","dt"], a1, [b1;b2], c1, [d1;d2], [x1;x2], dom1)
endfunction
