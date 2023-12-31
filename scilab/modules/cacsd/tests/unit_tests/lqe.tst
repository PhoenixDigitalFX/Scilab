//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================


nx=5;ne=2;ny=2;nu=2;
A = [1.29,0.52,0.72,0.51,0.78;
     0.09,0.29,0.9,0.52,0.79;
     0.62,0.65,0.24,0.56,0.98;
     0.35,0.09,0.43,0.56,0.82;
     0.71,0.45,0.97,0.47,1.43]-3.4*eye(nx,nx);
 
B = [0.53,0.75;
     0.99,0.41;
     0.65,0.61;
     0.99,0.85;
     0.05,0.06];

C = [0.03,0.7,0.83,0.53,0.05;
     0.24,0.12,0.32,0.57,0.82];

D = [0.58,0.95;
     0.28,0.91];

G = [0.34,0.39;
     0.12,0.57;
     0.93,0.71;
     0.73,0.68;
     0.9,0.41];

H = [0.14,0.42;
     0.5,0.86];
 


//The noises covariance matrices 
Q_e=eye(ne,ne);
R_v=diag(1:ny); 
S_ev=zeros(ne,ny);
S_ev(1,1)=0.8;
// |.                  |.
// |x=A*x+B*u+G*e  ==> |x=A*x+B*u+wx
// |y=C*x+D*u+H*v      |y=C*x+D*u+wy
Q=G*Q_e*G';
R=H*Q_e*H'+S_ev'*H'+H*S_ev+R_v;
S=G*(Q_e*H'+S_ev);

///////////////////////////////////////////////////////////////////////////////
////////////////////////////continuous time////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
P=syslin("c",A,B,C,D);

//---------------------Long syntax [K,X]=lqe(P,Q,R,S)--------------------

[K,X]=lqe(P,Q,R,S);
//check stability
assert_checktrue(real(spec(A+K*C))<0);
//Check Riccati equation
Ri=inv(R);
assert_checktrue(norm((A-S*Ri*C)*X+X*(A-S*Ri*C)'-X*C'*Ri*C*X+Q-S*Ri*S',1)<1e-10);
K_ref = [-0.3616759153211,-0.1110178709958;
-0.2372020763773,-0.1517016017562;
-0.8128203698340,-0.1797629199490;
-0.6629115152611,-0.1711847201561;
-0.7432515470988,-0.1126556947200];
assert_checktrue(norm(K-K_ref,1)<1e-10);
//with default S
[K0,X]=lqe(P,Q,R);
//check stability
assert_checktrue(real(spec(A+K0*C))<0);
//Check Riccati equation
Ri=inv(R);
assert_checktrue(norm(A*X+X*A'-X*C'*Ri*C*X+Q,1)<1e-10);

//---------------------Short syntax [K,X]=lqe(P21)------------------------------
BigQ=[Q,S;S' R];
[w,wt]=fullrf(BigQ);
Bw=w(1:nx,:);
Dw=w(nx+1:$,:);
P21=syslin("c",A,Bw,C,Dw);
[Ks,Xs]=lqe(P21);
assert_checktrue(norm(Ks-K,1)<1e-10);

///////////////////////////////////////////////////////////////////////////////
////////////////////////////Discrete time//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
Pd=dscr(P,0.1);
[K,X]=lqe(Pd,Q,R,S);
//check stability
assert_checktrue(abs(spec(Pd.A+K*Pd.C))<1);
//Check Riccati equation
Ric=Pd.A*X*Pd.A'-X-(Pd.A*X*Pd.C'+S)*pinv(Pd.C*X*Pd.C'+R)*(Pd.C*X*Pd.A'+S')+Q;
assert_checktrue(norm(Ric,1)<1e-10);
//with default S
[K0,X]=lqe(Pd,Q,R);
//check stability
assert_checktrue(abs(spec(Pd.A+K0*Pd.C))<1);
//Check Riccati equation

Ric=Pd.A*X*Pd.A'-X-(Pd.A*X*Pd.C')*pinv(Pd.C*X*Pd.C'+R)*(Pd.C*X*Pd.A')+Q;
    
assert_checktrue(norm(Ric,1)<1e-10);

//---------------------Short syntax [K,X]=lqe(P21)------------------------------
BigQ=[Q,S;S' R];
[w,wt]=fullrf(BigQ);
Bw=w(1:nx,:);
Dw=w(nx+1:$,:);
P21=syslin(Pd.dt,Pd.A,Bw,Pd.C,Dw);
[Ks,Xs]=lqe(P21);
assert_checktrue(norm(Ks-K,1)<1e-10);
