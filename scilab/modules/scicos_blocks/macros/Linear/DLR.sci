//  Scicos
//
// Copyright (C) INRIA - METALAU Project <scicos@inria.fr>
// Copyright (C) 2018 - 2019 - Samuel GOUGEON
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
//
// See the file ../license.txt
//

function [x,y,typ]=DLR(job,arg1,arg2)
    x=[];
    y=[];
    typ=[];
    select job
    case "set" then
        x=arg1;
        graphics=arg1.graphics;
        exprs=graphics.exprs
        model=arg1.model;
        x0=model.dstate;
        ns=prod(size(x0));
        %scicos_context=%scicos_context; //copy the semi-global variable locally
        %scicos_context.z=%z //add z definition to the context
        while %t do
            [ok,num,den,exprs]=scicos_getvalue(..
                _("Set discrete SISO transfer parameters"),..
                _(["Numerator (z)";
                   "Denominator (z)"]),..
            list("pol",1,"pol",1),exprs)
            if ~ok then
                break
            end
            if degree(num)>degree(den) then
                message(_("Transfer function must be proper (degree(numer) ≤ degree(denom))"))
                ok=%f
            end
            if ok then
                H=cont_frm(num,den)
                [A,B,C,D]=H(2:5);
                graphics.exprs=exprs;
                [ns1,ns1]=size(A)
                if ns1<=ns then
                    x0=x0(1:ns1)
                else
                    x0(ns1,1)=0
                end
                rpar=[A(:);
                B(:);
                C(:);
                D(:)]
                model.dstate=x0
                model.rpar=rpar
                if norm(D,1)<>0 then
                    mmm=[%t %f];
                else
                    mmm=[%f %f];
                end
                if or(model.dep_ut<>mmm) then
                    model.dep_ut=mmm,
                end
                x.graphics=graphics;
                x.model=model

                // Protecting ^{.} groups for LaTeX after num and den
                // have been generated: https://gitlab.com/scilab/scilab/-/issues/14551
                // and other protections and display improvements:
                content = exprs;
                if content~=[]
                    for i = 1:2
                        content(i) = expr2LaTeX(content(i))
                    end
                end
                lab = "DLR;displayedLabel=$\small\mathsf\frac{"+content(1)+"}{"+content(2)+"}$"
                x.graphics.style = lab;
                break
            end
        end
        x.model.firing=[] //compatibility
    case "define" then
        x0=0;
        A=-1;
        B=1;
        C=1;
        D=0;
        exprs=["1";"1+z"]

        model=scicos_model()
        model.sim=list("dsslti4",4)
        model.in=1
        model.out=1
        model.evtin=1
        model.dstate=x0(:)
        model.rpar=[A(:);B(:);C(:);D(:)]
        model.blocktype="d"
        model.dep_ut=[%f %f]

        gr_i=[]
        x=standard_define([3 3],model,exprs,gr_i)
    end
endfunction
