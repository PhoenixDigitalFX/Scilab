// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 1996 - 2016 - INRIA - Serge Steer
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function [kp,s]=krac2(sys)
    //The denominator of the closed loop system is den(s)+K*num(s). So the
    //  the closed loops poles verify K(s)=-den(s)/num(s)
    //The real axis breakaway points occurs at the extrema of the K(s)
    // so at the point where K'=dK/ds = 0
    // K'=-(den'*num-den*num')/num^2
    // K'= 0 --> den'*num-den*num'=0
    //  http://www.scribd.com/doc/21374148/An-Introduction-to-Control-Systems
    if and(typeof(sys)<>["state-space" "rational" "zpk"]) then
        ierr=execstr("[kp,s]=%"+typeof(sys,"overload")+"_krac2(sys)","errcatch")
        if ierr<>0 then
            error(msprintf(_("%s: Wrong type for input argument #%d: Linear dynamical system expected.\n"),"krac2",1))
        end
        return
    end

    if size(sys,"*")<>1 then
        error(msprintf(gettext("%s: Wrong size for input argument #%d: Single input, single output system expected.\n"),"krac2",1))
    end

    if typeof(sys)=="state-space" then
        sys=ss2tf(sys)
    elseif typeof(sys)=="zpk" then
        sys=zpk2tf(sys)
    end
    num=sys.num;
    den=sys.den;

    s=roots(derivat(num)*den-derivat(den)*num,"e")
    //collect the real roots only
    i=find(abs(imag(s))<=10*%eps)
    if i==[] then kp=[],s=[];return,end
    s=real(s(i))'
    s=s(horner(num,s)<>0);
    kp=-real(freq(den,num,real(s)));
    i=find(kp>=0);
    kp=kp(i)
    s=s(i)
endfunction

