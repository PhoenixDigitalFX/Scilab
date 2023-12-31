// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// to check that bvode works
funcprot(0);

function df=dfsub(x,z)
    df=[0,0,-6/x**2,-6/x]
endfunction

function f=fsub(x,z)
    f=(1 -6*x**2*z(4)-6*x*z(3))/x**3
endfunction

function g=gsub(i,z)
    g=[z(1),z(3),z(1),z(3)];g=g(i)
endfunction

function dg=dgsub(i,z)
    dg=[1,0,0,0;0,0,1,0;1,0,0,0;0,0,1,0];
    dg=dg(i,:);
endfunction

function [z,mpar]=guess(x)// unused here
    z=0;
    mpar=0;
endfunction

 //define trusol for testing purposes
function u=trusol(x)
    u= zeros(4,1)
    u(1) =  0.25*(10*log(2)-3)*(1-x) + 0.5 *( 1/x   + (3+x)*log(x) - x)
    u(2) = -0.25*(10*log(2)-3)       + 0.5 *(-1/x^2 + (3+x)/x      + log(x) - 1)
    u(3) = 0.5*( 2/x^3 + 1/x   - 3/x^2)
    u(4) = 0.5*(-6/x^4 - 1/x/x + 6/x^3)
endfunction

fixpnt=0;
m=4;
ncomp=1;
aleft=1;
aright=2;
zeta=[1,1,2,2];
ipar=zeros(1,11);
ipar(3)=1;
ipar(4)=2;
ipar(5)=2000;
ipar(6)=200;
ipar(7)=1;
ltol=[1,3];
tol=[1.e-11,1.e-11];
res=aleft:0.1:aright;

z=bvode(res,ncomp,m,aleft,aright,zeta,ipar,ltol,tol,fixpnt,fsub,dfsub,gsub,dgsub,guess);
z1=[];for x=res,z1=[z1,trusol(x)]; end;
if norm(z-z1) > 1D8*%eps then pause,end;

clear gsub
clear guess
clear trusol
exec(SCI+'/modules/differential_equations/tests/unit_tests/bvode_tst.sci');

[z,zf]=col1();
if max(abs(z-zf))>1.e-5 then pause,end

[z,zf]=col2(0);
// Fortran Coded version
if max(abs(z-zf))>1.e-2 then pause,end

[z,zf]=col2(1);
// Scilab coded version
if max(abs(z-zf))>1.e-2 then pause,end

