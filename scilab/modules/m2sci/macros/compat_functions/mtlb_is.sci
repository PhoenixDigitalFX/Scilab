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

function str=mtlb_is(sto,sfrom,i,j)
    //emulate the matlab syntax sto(i [,j])=sfrom for strings
    [lhs,rhs]=argn()

    [mto,nto]=size(sto)
    // convert sto to a regular matrix
    if type(sto)==10 then
        if nto<>1 then error(msprintf(gettext("%s: Wrong size for input argument #%d: Matlab vector of strings expected.\n"),"mtlb_is",1)),end
        if mto==1 then
            lnto=length(sto)
            sto=ascii(sto)
        else
            lnto=max(length(sto))
            sto=matrix(ascii(part(sto,1:lnto)),lnto,mto)'
        end
        typeout=10
    else
        typeout=1
    end

    [mfrom,nfrom]=size(sfrom)
    // convert sfrom to a regular matrix
    if type(sfrom)==10 then
        if nfrom<>1 then error(msprintf(gettext("%s: Wrong size for input argument #%d: Matlab vector of strings expected.\n"),"mtlb_is",2)),end
        if mfrom==1 then
            lnfrom=length(sfrom)
            sfrom=ascii(sfrom)
        else
            lnfrom=max(length(sfrom))
            sfrom=matrix(ascii(part(sfrom,1:lnfrom)),lnfrom,mfrom)'
        end
    end
    //insert
    if rhs==4 then
        sto(i,j)=sfrom
    else
        sto(i)=sfrom
        if sfrom==[] then sto=sto',end
    end
    if typeout==10 then
        // convert back
        str=[]
        for k=1:size(sto,1)
            str=[str;ascii(sto(k,:))]
        end
    end
endfunction
