// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Serge Steer
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================



// Case #1
a=-1/3;
b=1;
c=1;
sl=syslin("c",a,b,c);
sld=dscr(sl,0.1);
assert_checkequal ( sld.dt , 0.1);
assert_checkalmostequal (sld.A ,exp(sl.A*0.1));
assert_checkalmostequal (sld.B , sl.A\(sld.A-eye())*sl.B );

assert_checktrue(sld==dscr(zpk(sl),0.1));
assert_checktrue(sld==dscr(ss2tf(sl),0.1));

// Case #2
a=[0.9,0,0.6,-1.4,-4.2;
   0.2,0.1,-0.2,0.5,0.6;
   -4.3,0,2.2,0,2.4;
   -3.7,-0.5,2.4,-0.6,2.7;
   6.4,0.1,-4,-0.5,-4];

b=[-0.1,-0.1,0;
   0,0,0.1;
   -0.1,0.2,-0.1;
   0.2,0.2,-0.6;
   0.2,-0.1,0.1];
 
c=[2,7,-2,5,1
   0,-1,3,0,2];
d=[1,0,0
   0,0,0];

sl=syslin('c',a,b,c,d);
sld=dscr(sl,0.1);
assert_checkequal ( sld.dt , 0.1);
assert_checkalmostequal (sld.A ,expm(sl.A*0.1));
assert_checkalmostequal (sld.B , sl.A\(sld.A-eye())*sl.B);

S=zpk({[],1},{-1,[-2 -3]},[1 1],"c");
assert_checktrue(dscr(zpk2ss(S),0.1)==dscr(S,0.1));

