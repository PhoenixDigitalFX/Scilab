//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte Hecquet
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

nbPoints = 5; // Number of points computed

// Real parameters a,b,c: here, y=u
a=cat(2,1,zeros(1,nbPoints - 1));
b=cat(2,1,zeros(1,nbPoints - 1));
c=zeros(1,nbPoints);

// Generate input signal
t=linspace(0,50,1000);
w=%pi/4;
u=cos(w*t);

// Generate output signal
Arma=armac(a,b,c,1,1,0);
y=arsimul(Arma,u);

// Arguments of rpem
phi=zeros(1,nbPoints*3);
psi=zeros(1,nbPoints*3);
l=zeros(1,nbPoints*3);
p=1*eye(nbPoints*3,nbPoints*3);
theta=[0*a 0*b 0*c];
w0=list(theta,p,l,phi,psi);
[w0, v]=rpem(w0,u,y);

assert_checkequal(size(w0), 5);
assert_checkequal(size(v,"*"), 1);
assert_checkalmostequal(v, 0.57451013690216091);

assert_checkequal(size(w0(1)), [1, 15]);
assert_checkequal(size(w0(2)), [15, 15]);
assert_checkequal(size(w0(3)), [1, 15]);
assert_checkequal(size(w0(4)), [1, 15]);
assert_checkequal(size(w0(5)), [1, 15]);
assert_checkalmostequal(sum(w0(1)),  - 1.6187817562697728);
assert_checkalmostequal(sum(w0(2)), 925.971144340439537);
assert_checkalmostequal(sum(w0(3)), 0.06147492702030416);
assert_checkalmostequal(sum(w0(4)), 0.19515684603135780);
assert_checkalmostequal(sum(w0(5)), 0.22685582794021467);
