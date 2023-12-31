// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 8777 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8777
//
// <-- Short Description -->
// The neldermead function may fail to restart with bounds.
//

// Script #1

function [ f , index ] = myquad ( x , index )
    f = x(1)^2 + x(2)^2 + x(3)^2
endfunction
rand("seed" , 0)
x0 = [1.2 1.9,1.5].';
nm = neldermead_new ();
nm = neldermead_configure(nm,"-numberofvariables",3);
nm = neldermead_configure(nm,"-function",myquad);
nm = neldermead_configure(nm,"-x0",x0);
nm = neldermead_configure(nm,"-method","box");
nm = neldermead_configure(nm,"-boundsmin",[1 1 1]);
nm = neldermead_configure(nm,"-boundsmax",[2 2 2]);
nm = neldermead_configure(nm,"-simplex0method","randbounds");
nm = neldermead_search(nm);
nm = neldermead_configure(nm,"-maxiter",200);
nm = neldermead_configure(nm,"-maxfunevals",200);
instr = "nm = neldermead_restart(nm)";
lclmsg = gettext("%s: The initial simplex method ""%s"" is not compatible with the restart simplex method ""%s""");
assert_checkerror( instr, lclmsg , [], "neldermead_updatesimp", "randbounds" ,"oriented");
nm = neldermead_destroy(nm);

// Script #2

function [ f , index ] = myquad ( x , index )
    f = x(1)^2 + x(2)^2 + x(3)^2
endfunction
rand("seed" , 0)
x0 = [1.2 1.9,1.5].';
nm = neldermead_new ();
nm = neldermead_configure(nm,"-numberofvariables",3);
nm = neldermead_configure(nm,"-function",myquad);
nm = neldermead_configure(nm,"-x0",x0);
nm = neldermead_configure(nm,"-method","box");
nm = neldermead_configure(nm,"-boundsmin",[1 1 1]);
nm = neldermead_configure(nm,"-boundsmax",[2 2 2]);
nm = neldermead_configure(nm,"-simplex0method","randbounds");
nm = neldermead_search(nm);
nm = neldermead_configure(nm,"-maxiter",200);
nm = neldermead_configure(nm,"-maxfunevals",200);
nm = neldermead_configure(nm,"-restartsimplexmethod","randbounds");
nm = neldermead_restart(nm);
//
xopt = neldermead_get(nm,"-xopt");
xstar = [1;1;1];
assert_checkalmostequal(xopt,xstar,1.e-4);
//
fopt = neldermead_get(nm,"-fopt");
fstar = 3;
assert_checkalmostequal(fopt,fstar,1.e-4);
//
nm = neldermead_destroy(nm);




