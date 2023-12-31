//<-- CLI SHELL MODE -->
//<-- NO CHECK REF -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 6829 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6829
//
// <-- Short Description -->
//  kpure fails to compute  gains when applied to an high degree system

num=real(poly([-1+%i*1, -1-%i*1, 2+%i*8  2-%i*8 -2.5+%i*13 -2.5-%i*13],'s'));
den=real(poly([1 1 3+%i*3 3-%i*3 -15+%i*7  -15-%i*7  -3 -7 -11],'s'));
h=num/den;

[K,Y]=kpure(h);
n=size(K,'*');
if n<>4 then pause,end
for i=1:n
  r=roots((h/.K(i)).den);
  r=r(abs(real(r))<1e-6);//pure imaginary
  r=r(imag(r)>0); //retains only positive imaginary part
  if r==[] then pause,end
  if abs(r-Y(i))>1e-10 then pause,end
end
