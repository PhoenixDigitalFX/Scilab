// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2000- 2016 INRIA -
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function [K,X]=lqr(P12,Q,R,S)
    //lqr gain for full-state LQ problem
    //(discrete or continuous)
    //          discrete                        continuous
    //      |I   0   0|   | A    0   B  |      |I   0   0|   | A    0    B  |
    //     z|0   A'  0| - |-C'C  I   -S'|    s |0   I   0| - |-C'C -A'  -S' |
    //      |0   B'  0|   | S    0   D'D|      |0   0   0|   | S   -B'   D'D|
    if typeof(P12)<>"state-space" then
        error(msprintf(gettext("%s: Wrong type for input argument #%d: Linear state space expected.\n"),"lqr",1))
    end

    if P12.dt == [] then
        error(msprintf(gettext("%s: Wrong value for input argument #%d: Time domain must be ''c'' or ''d''.\n"),"lqr",1))
    end

    if argn(2)>1 then //[K,X]=lqr(P,Q,R,S)
        A=P12.A
        B2=P12.B
        [nx,nu]=size(B2)
        if or(size(Q)<>nx) then
            error(msprintf(_("%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n"),"lqr",2,nx,nx))
        end

        if or(size(R)<>nu) then
            error(msprintf(_("%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n"),"lqr",3,nu,nu))
        end

        if norm(Q.'-Q,1)>100*%eps*norm(Q,1) then
            error(msprintf(_("%s: Wrong value for input argument #%d: Must be symmetric.\n"),"lqr",2))
        end

        if norm(R.'-R,1)>100*%eps*norm(R,1) then
            error(msprintf(_("%s: Wrong value for input argument #%d: Must be symmetric.\n"),"lqr",3))
        end

        if argn(2)<4 then
            S=zeros(nu,nx);
        elseif or(size(S)<>[nu,nx]) then
            error(msprintf(_("%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n"),"lqr",4,nu,nx))
        end
    else //[A,B2,C1,D12]=P12(2:5);
        A=P12.A
        B2=P12.B
        C1=P12.C
        D12=P12.D
        Q=C1'*C1;R=D12'*D12;S=D12'*C1;
        //[Q S;S' R]
    end

    [n,nu]=size(B2);

    if P12.dt == "c"
        Z=0*A;I=eye(A);O=zeros(n,nu);
        bigE=[I,Z,O; ...
            Z,I,O; ...
            zeros(nu,2*n+nu)];

        bigA=[A ,Z,   B2; ...
            -Q ,-A',-S'; ...
            S ,B2', R];
        Ri=inv(R);
        Left=[I,  Z,  -B2*Ri;
        Z,  I,  S'*Ri;
        zeros(nu,2*n), Ri];

        LA=Left*bigA;
        LE=Left*bigE;
        N=1:2*n;
        //[wsmall,ks1]=schur(LA(N,N),LE(N,N),'c');
        [wsmall,ks1]=schur(LA(N,N),"c");

        if ks1<>n then
            error(msprintf(gettext("%s: Stable subspace is too small.\n"),"lqr"));
        end

        X12=wsmall(1:n,1:n);
        phi12=wsmall(n+1:$,1:n);
        X=phi12/X12;
        if rcond(X12)< 1.d-5 then
            warning(msprintf(gettext("%s: Bad conditionning.\n"),"lqr"));
        end

        K=-Ri*(B2'*X+S);

        //////////////////////////////
        // Other implementation ... //
        //////////////////////////////
        //[w,ks]=schur(bigA,bigE,'c');
        //if ks<>n then error('lqr: stable subspace too small!');end
        //ws=w(:,1:n);
        //X12=ws(1:n,:);
        //phi12=ws(n+1:2*n,:);
        //u12=ws(2*n+1:2*n+nu,:);
        //if rcond(X12)< 1.d-5 then warning('lqr: bad conditionning!');end
        //K=u12/X12;
        //X=phi12/X12;
    elseif P12.dt == "d" | type(P12.dt)==1
        I=eye(A);Z=0*I;
        bigE=[I,Z,0*B2; ...
            Z,A',0*B2; ...
            0*B2',-B2',0*B2'*B2];

        bigA=[A,Z, B2; ...
            -Q ,I, -S'; ...
            S, 0*B2', R];

        Ri=inv(R);

        Left=[I,  Z,  -B2*Ri; ...
            Z,  I,  S'*Ri; ...
            zeros(nu,2*n), Ri];
        LA=Left*bigA;
        LE=Left*bigE;
        N=1:2*n;
        [wsmall,ks1]=schur(LA(N,N),LE(N,N),"d");

        if ks1<>n then
            error(msprintf(gettext("%s: Stable subspace is too small.\n"),"lqr"));
        end

        X12=wsmall(1:n,1:n);phi12=wsmall(n+1:$,1:n);X=phi12/X12;
        if rcond(X12)< 1.d-5 then
            warning(msprintf(gettext("%s: Bad conditionning.\n"),"lqr"));
        end

        K=-pinv(B2'*X*B2+R)*(B2'*X*A+S);
        ////////////////////
        // Other form ... //
        ////////////////////
        //[w,ks]=schur(bigA,bigE,'d');
        //if ks<>n then error('lqr: stable subspace too small!');end
        //ws=w(:,1:n);
        //X12=ws(1:n,:);
        //phi12=ws(n+1:2*n,:);
        //u12=ws(2*n+1:2*n+nu,:);
        //if rcond(X12)< 1.d-5 then warning('lqr: bad conditionning!');end
        //K=u12/X12;
        //X=phi12/X12;
    end

endfunction
