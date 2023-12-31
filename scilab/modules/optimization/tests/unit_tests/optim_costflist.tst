// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// optim_costflist.tst --
//   Test the optim command in the case where the cost function is a list.
//
//
// In the following case, costf is equal to list(sipn,sip2,ne,nc,cpen)
// where sipn is a function.
// The case is even more complex, since the 3d argument
// of sipn is the dummy argument sip1, which is, in turn, 
// a function which real value is sip2.
// penalization (see doc)
//
// min (x1^2 +x2^2)/2 ; x1>=0, x1 + x2 =1 (solution [0.5 0.5] )

function [f,g,ind]=sip2(x,ind)
  f= [ x(1)+x(2)-1, -x(1), (x(1)^2+x(2)^2)/2]
  g= [ 1, -1, x(1); 1,  0, x(2)]
endfunction

cpen=50; 
ne=1; 
nc=2;
bi=[0 0]; 
bs=[2 2];

function [fpen,gpen,ind]=sipn(x,ind,sip1,ne,nc,cpen)
  [f,g,indic]=sip1(x,ind)
  if indic < 0 then 
    ind=indic
    return
  end
  if nc >ne then 
    for i=ne+1:nc
      f(i)=max([0 f(i)])
    end
  end
  fpen=f(nc+1) + cpen*norm(f(1:nc))^2/2';
  if ind==2 then 
    return
  end
  gpen=g(:,nc+1)
  if ne > 0 then
    for i=1:ne
      gpen=gpen + cpen*f(i)*g(:,i)
    end
  end
  if nc > ne then
    for i=ne+1:nc
      if f(i) > 0 then 
         gpen=gpen + cpen*f(i)*g(:,i)
      end
    end
  end;
endfunction
[f,x,g]=optim(list(sipn,sip2,ne,nc,cpen),...
              'b',bi,bs,[1 1],'ar',20,20,1.e-15);
if norm(x-[0.5 0.5]) + norm(g) > 0.1 then pause,end

