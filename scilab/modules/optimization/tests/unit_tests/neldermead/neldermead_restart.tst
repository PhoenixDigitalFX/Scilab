// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2009 - INRIA - Michael Baudin
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->



function [ y , index ] = rosenbrock ( x , index )
  y = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
endfunction


//
// Test with default NM
//
nm = neldermead_new ();
nm = neldermead_configure(nm,"-numberofvariables",2);
nm = neldermead_configure(nm,"-function",rosenbrock);
nm = neldermead_configure(nm,"-x0",[-1.2 1.0].');
nm = neldermead_search(nm);
nm = neldermead_restart(nm);
nm = neldermead_destroy(nm);
//
// Test with and maximum number of iterations reached
//
nm = neldermead_new ();
nm = neldermead_configure(nm,"-numberofvariables",2);
nm = neldermead_configure(nm,"-function",rosenbrock);
nm = neldermead_configure(nm,"-x0",[-1.2 1.0].');
nm = neldermead_configure(nm,"-maxiter",10);
nm = neldermead_search(nm);
nm = neldermead_configure(nm,"-maxiter",100);
nm = neldermead_restart(nm);
assert_checktrue(neldermead_get(nm,"-iterations")>10);
nm = neldermead_destroy(nm);

function [ f , index ] = objfun ( x , index ) 
  f = exp(x(1))*(4*x(1)^2+2*x(2)^2+x(1)*x(2)+2*x(2));
endfunction
xopt = [4/31;-33/62];
fopt = -%e^(4/31)/2;
//
// Test with "difficult case"
//
nm = neldermead_new ();
nm = neldermead_configure(nm,"-numberofvariables",2);
nm = neldermead_configure(nm,"-function",objfun);
nm = neldermead_configure(nm,"-x0",[-1 1].');
nm = neldermead_search(nm);
nm = neldermead_configure(nm,"-maxfunevals",200);
nm = neldermead_restart(nm);
xc = neldermead_get(nm,"-xopt");
fc = neldermead_get(nm,"-fopt");
assert_checkalmostequal(xc,xopt,1.e-7);
assert_checkalmostequal(fc,fopt,1.e-15);
nm = neldermead_destroy(nm);

