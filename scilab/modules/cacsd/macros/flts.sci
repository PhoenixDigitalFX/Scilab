// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA - Serge Steer
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function [y,xf] = flts(u, sl, x0)
    fname = "flts";
    [lhs, rhs] = argn(0)
    if type(u) <> 1 then
        msg = gettext("%s: Argument #%d: Decimal or complex number(s) expected.\n")
        error(msprintf(msg, fname, 1))
    end
    if rhs <= 1 then
        msg = gettext("%s: Wrong number of input arguments: %d or %d expected.\n")
        error(msprintf(msg, fname, 2, 3))
    end
    [nu,mu] = size(u)
    if typeof(sl)=="zpk" then
        sl = zpk2tf(sl)
    end
    select typeof(sl)
    case "state-space" then
        if rhs==2 then
            x0 = sl.X0
        end
        [nb,mb] = size(sl.B)
        if mb <> nu then
          msg = gettext("%s: Arguments #%d and #%d: Incompatible sizes.\n")
          error(msprintf(msg, fname, 1, 2))
        end;
        if sl.dt=="c" then
          msg = gettext("%s: Wrong type for argument #%d: In discrete time expected.\n")
          error(msprintf(msg, fname, 2))
        end
        np = max(0, max(degree(sl.D)))
        [xf,x] = ltitr(sl.A, sl.B, u(:,1:(mu-np)), x0)
        D = sl.D
        if type(D)==1 then
            y = sl.C*x + D*u
        else
            y = sl.C*x + rtitr(D,eye(D),u)
        end
    case "rational"  then
        if lhs>1 then
            msg = gettext("%s: Wrong number of output argument: %d expected.\n")
            error(msprintf(msg, fname, 1))
        end
        [num, den] = sl(["num","den"]);
        [ns, ne] = size(num)
        if sl.dt=="c" then
          msg = gettext("%s: Wrong type for argument #%d: In discrete time expected.\n")
          error(msprintf(msg, fname, 2))
        end
        if ne<>nu then
          msg = gettext("%s: Arguments #%d and #%d: Incompatible sizes.\n")
          error(msprintf(msg, fname, 1, 2))
        end
        for l = 1:1:ns
            pp=den(l,1);
            for k=2:ne
                [pg,uu] = bezout(pp,den(l,k)),pp=pp*uu(1,2)
            end
            nden(l) = pp
            for k = 1:ne
                nnum(l,k) = num(l,k)*pdiv(pp,den(l,k))
            end
        end
        for l = 1:ns
            nm(l) = max(0, degree(nden(l))) - max(0, max(degree(nnum(l,:))))
        end
        ly = mu+min(nm)
        if rhs==3 then
            [mx, nx] = size(x0);
            maxdgd = max(0, max(degree(nden)))
            if nx < maxdgd then
                msg = gettext("%s: At least %s past values needed.\n")
                error(msprintf(msg, fname, string(maxdgd)))
            end
            if mx <> ns+ne then
                msg = gettext("%s: Arguments #%d and #%d: Incompatible sizes.\n")
                error(msprintf(msg, fname, 2, 3))
            end
        end
        y = zeros(ns,ly);
        for l = 1:ns
            ddl = max(0, degree(nden(l)))
            dnl = max(0, max(degree(nnum(l,:))))
            lent = ly-ddl+dnl
            select rhs
            case 2 then
                yl = rtitr(nnum(l,:),nden(l),u(:,1:lent));
                [nn, mm] = size(yl);
                y(l, 1:mm) = yl;
                //                    y=y(:,1:lent);
            case 3 then
                up = x0(1:ne, maxdgd-ddl+1:maxdgd);
                yp = x0(ne+l, maxdgd-ddl+1:maxdgd);
                y(l,:) = rtitr(nnum(l,:), nden(l), u(:,1:lent), up, yp);
            end;
        end,
        l=size(y,2);
        y=y(:,1:min(mu,l));
    else
        args = ["u","sl","x0"]
        ierr = execstr("[y,xf]=%"+typeof(sl,"overload")+"_flts("+strcat(args(1:rhs),",")+")", "errcatch")
        if ierr <> 0 then
            msg = _("%s: Wrong type for input argument #%d: Linear dynamical system expected.\n")
            error(msprintf(msg, fname, 2))
        end
    end
endfunction
