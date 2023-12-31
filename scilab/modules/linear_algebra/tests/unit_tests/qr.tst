//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
function r=Err(x),r=norm(x,1),endfunction
rand('normal')
//==========================================================================
//==============================      qr      ============================== 
//==========================================================================
//Empty matrix

e=[];
if qr(e)<>[] then pause,end
if qr(e,"e")<>[] then pause,end

[Q,R]=qr(e);
if Q<>[]|R<>[] then pause,end
[Q,R]=qr(e,"e");
if Q<>[]|R<>[] then pause,end

[Q,R,x]=qr(e);
if Q<>[]|R<>[]|x<>[] then pause,end
[Q,R,x]=qr(e,"e");
if Q<>[]|R<>[]|x<>[] then pause,end

//Small dimension
//---------------
A=rand(3,2);Ac=A+rand(A)*%i;

//Real Case
Q=qr(A);
if Err(Q*Q'-eye())> 200*%eps then pause,end
Q=qr(A,"e");
if Err(Q'*Q-eye())> 200*%eps then pause,end

[Q,R]=qr(A);
if Err(Q*R-A)> 200*%eps then pause,end

[Q,R]=qr(A,"e");
if Err(Q*R-A)> 200*%eps then pause,end
if Err(Q'*Q-eye())> 200*%eps then pause,end

Q=qr(A');
if Err(Q*Q'-eye())> 200*%eps then pause,end
Q=qr(A',"e");
if Err(Q*Q'-eye())> 200*%eps then pause,end

[Q,R]=qr(A');
if Err(Q*R-A')> 200*%eps then pause,end

[Q,R]=qr(A',"e");
if Err(Q*R-A')> 200*%eps then pause,end

[Q,R,x]=qr(A);
if Err(Q*R*x'-A)> 200*%eps then pause,end

[Q,R,x]=qr(A,"e");
if Err(Q*R*x'-A)> 200*%eps then pause,end

//Complex case
Q=qr(Ac);
if Err(Q*Q'-eye())> 200*%eps then pause,end
Q=qr(Ac,"e");
if Err(Q'*Q-eye())> 200*%eps then pause,end

[Q,R]=qr(Ac);
if Err(Q*R-Ac)> 200*%eps then pause,end
[Q,R]=qr(Ac,"e");
if Err(Q*R-Ac)> 200*%eps then pause,end
if Err(Q'*Q-eye())> 200*%eps then pause,end

Q=qr(Ac');
if Err(Q*Q'-eye())> 200*%eps then pause,end
Q=qr(Ac',"e");
if Err(Q*Q'-eye())> 200*%eps then pause,end


[Q,R]=qr(Ac');
if Err(Q*R-Ac')> 200*%eps then pause,end
[Q,R]=qr(Ac',"e");
if Err(Q*R-Ac')> 200*%eps then pause,end

[Q,R,x]=qr(Ac);
if Err(Q*R-Ac*x)> 200*%eps then pause,end
[Q,R,x]=qr(Ac,"e");
if Err(Q*R-Ac*x)> 200*%eps then pause,end

[Q,R,x]=qr(Ac');
if Err(Q*R-Ac'*x)> 200*%eps then pause,end
[Q,R,x]=qr(Ac',"e");
if Err(Q*R-Ac'*x)> 200*%eps then pause,end

//Rank detection
[Q,R,rk,x]=qr(A);
if Err(Q*R*x'-A)> 200*%eps | rk<>2  then pause,end
[Q,R,rk,x]=qr(A,1.d-8);
if Err(Q*R*x'-A)> 200*%eps | rk<>2  then pause,end

[Q,R,rk,x]=qr(Ac);
if Err(Q*R*x'-Ac)> 200*%eps | rk<>2  then pause,end

[Q,R,rk,x]=qr(Ac,1.d-8);
if Err(Q*R*x'-Ac)> 200*%eps | rk<>2  then pause,end

//Large dimension
//---------------
A=rand(150,60);Ac=A+rand(A)*%i;
//Real Case
Q=qr(A);
if Err(Q*Q'-eye())> 1000*%eps then pause,end
Q=qr(A,"e");
if Err(Q'*Q-eye())> 1000*%eps then pause,end

[Q,R]=qr(A);
if Err(Q*R-A)> 1000*%eps then pause,end

[Q,R]=qr(A,"e");
if Err(Q*R-A)> 1000*%eps then pause,end
if Err(Q'*Q-eye())> 1000*%eps then pause,end

Q=qr(A');
if Err(Q*Q'-eye())> 1000*%eps then pause,end
Q=qr(A',"e");
if Err(Q*Q'-eye())> 1000*%eps then pause,end

[Q,R]=qr(A');
if Err(Q*R-A')> 1000*%eps then pause,end

[Q,R]=qr(A',"e");
if Err(Q*R-A')> 1000*%eps then pause,end

[Q,R,x]=qr(A);
if Err(Q*R*x'-A)> 1000*%eps then pause,end

[Q,R,x]=qr(A,"e");
if Err(Q*R*x'-A)> 1000*%eps then pause,end

//Complex case
Q=qr(Ac);
if Err(Q*Q'-eye())> 2000*%eps then pause,end
Q=qr(Ac,"e");
if Err(Q'*Q-eye())> 2000*%eps then pause,end

[Q,R]=qr(Ac);
if Err(Q*R-Ac)> 2000*%eps then pause,end
[Q,R]=qr(Ac,"e");
if Err(Q*R-Ac)> 2000*%eps then pause,end
if Err(Q'*Q-eye())> 2000*%eps then pause,end

Q=qr(Ac');
if Err(Q*Q'-eye())> 2000*%eps then pause,end
Q=qr(Ac',"e");
if Err(Q*Q'-eye())> 2000*%eps then pause,end


[Q,R]=qr(Ac');
if Err(Q*R-Ac')> 2000*%eps then pause,end
[Q,R]=qr(Ac',"e");
if Err(Q*R-Ac')> 2000*%eps then pause,end

[Q,R,x]=qr(Ac);
if Err(Q*R-Ac*x)> 2000*%eps then pause,end
[Q,R,x]=qr(Ac,"e");
if Err(Q*R-Ac*x)> 2000*%eps then pause,end

[Q,R,x]=qr(Ac');
if Err(Q*R-Ac'*x)> 2000*%eps then pause,end
[Q,R,x]=qr(Ac',"e");
if Err(Q*R-Ac'*x)> 2000*%eps then pause,end

//Rank detection
[Q,R,rk,x]=qr(A);
if Err(Q*R*x'-A)> 2000*%eps | rk<>60  then pause,end
[Q,R,rk,x]=qr(A,1.d-8);
if Err(Q*R*x'-A)> 2000*%eps | rk<>60  then pause,end

[Q,R,rk,x]=qr(Ac);
if Err(Q*R*x'-Ac)> 2000*%eps | rk<>60  then pause,end

[Q,R,rk,x]=qr(Ac,1.d-8);
if Err(Q*R*x'-Ac)> 2000*%eps | rk<>60  then pause,end

