// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA - Serge STEER
// Copyright (C) 2012 - 2016 - Scilab Enterprises
// Copyright (C) 2018 - Samuel GOUGEON
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function s2 = %s_i_r(varargin)
    s1 = varargin($-1)
    s2 = varargin($)
    //s2(i,j)=s1 s1 matrix of scalar
    sel = 1:$-2
    if type(varargin(2))==1 & varargin(2)==0
        sel = 1     // linearized indices
    end
    num = s2.num;
    if s1==[] then
        den = s2.den;
        num(varargin(sel)) = [];
        den(varargin(sel)) = [];
    else
        ind = list();
        for i = size(num),ind($+1) = 1:i; end
        num(varargin(sel)) = s1
        den = ones(num)
        den(ind(:)) = s2.den;
        den(varargin(sel)) = 1
    end
    s2 = rlist(num,den,s2.dt)
endfunction
