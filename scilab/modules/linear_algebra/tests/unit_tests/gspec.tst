//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
rand('normal')

//define tools
function A=testmat1(a,n)
	//eigen values are given by a dilation of nth roots of 1
	A=diag(a*ones(1,n-1),1)+diag((1/a)*ones(1,n-1),-1)
	A(1,n)=1/a;A(n,1)=a
endfunction
function r=Err(x)
	r=norm(x,1)
endfunction


//
// gc_spec.tst --
//   Test spec with 2 RHS (i.e. generalized eigenvalues)
//   and one or several LHS.
//

//Empty matrix
// 1 LHS
S=spec([],[]);
if S<>[] then pause,end
// 2 LHS
[al,be]=spec([],[]);
if al<>[]|be<>[] then pause,end
// 3 LHS
[al,be,R]=spec([],[]);
if al<>[]|be<>[]|R<>[] then pause,end
// 4 LHS
[al,be,L,R]=spec([],[]);
if al<>[]|be<>[]|L<>[]|R<>[] then pause,end


//Matrix with Inf or Nan (test de la detection d'erreur

// 1 A Real, B, Real
if execstr('spec([%inf 1;2 3],[%inf 1;2 3])','errcatch')==0 then pause,end
if execstr('spec([%inf 1;2 3],[1 2;3 4])','errcatch')==0 then pause,end
if execstr('spec([1 2;3 4],[1 %nan;2 3])','errcatch')==0 then pause,end
// 2 A Complex, B Complex
if execstr('spec([%inf %i;2 3],[%inf %i;2 3])','errcatch')==0 then pause,end
// 3 A Real, B Complex
if execstr('spec([%inf 1;2 3],[%inf %i;2 3])','errcatch')==0 then pause,end
// 4 A Complex, B Real
if execstr('spec([%inf %i;2 3],[%inf 1;2 3])','errcatch')==0 then pause,end

errorlevel = 1000*%eps;

//Small dimension
//---------------
//Real Case
A=testmat1(3,5);
E=testmat1(-2,5);
// 1 LHS
S=spec(A,E);
// 2 LHS
[Sa,Se]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
// 3 LHS
[Sa,Se,R]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
// 4 LHS
[Sa,Se,L,R]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
if Err(L'*A-diag(S)*L'*E)>errorlevel then pause,end

// Complex Case : A complex, E complex
A=testmat1(3-%i,5);
E=testmat1(-2+0.1*%i,5);
// 1 LHS
S=spec(A,E);
// 2 LHS
[Sa,Se]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
// 3 LHS
[Sa,Se,R]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
// 4 LHS
[Sa,Se,L,R]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
if Err(L'*A-diag(S)*L'*E)>errorlevel then pause,end

// Mixed case : A real, E complex
A = eye(3,3);
E = eye(3,3) * %i;
[Sa,Se,R]=spec(A,E);
S=Sa./Se;
if Err(A*R-E*R*diag(S))>errorlevel then pause,end

// Mixed case : A complex, E real
A = eye(3,3) * %i;
E = eye(3,3);
[Sa,Se,R]=spec(A,E);
S=Sa./Se;
if Err(A*R-E*R*diag(S))>errorlevel then pause,end

//Large dimension
//---------------

//Real Case
A=testmat1(3,30);
E=testmat1(-2,30);
S=spec(A,E);
[Sa,Se]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
[Sa,Se,R]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
[Sa,Se,L,R]=spec(A,E);
if Err(S-Sa./Se)>errorlevel then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
if Err(L'*A-diag(S)*L'*E)>errorlevel then pause,end

//Complex Case

A=testmat1(3-%i,30);
E=testmat1(-2+0.1*%i,30);
S=spec(A,E);
[Sa,Se]=spec(A,E);
if Err(S-Sa./Se)>20*%eps then pause,end
[Sa,Se,R]=spec(A,E);
if Err(S-Sa./Se)>20*%eps then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
[Sa,Se,L,R]=spec(A,E);
if Err(S-Sa./Se)>20*%eps then pause,end
if Err(A*R-E*R*diag(S))>errorlevel then pause,end
if Err(L'*A-diag(S)*L'*E)>errorlevel then pause,end

