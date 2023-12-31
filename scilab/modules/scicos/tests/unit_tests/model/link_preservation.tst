// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

loadXcosLibs();
scicos_log("TRACE");

b = scicos_block();
d = scicos_diagram( objs=list(scicos_link(from=[3 3 0],to=[5 2 1]) ));
b.model.rpar = d;
// b is now a SuperBlock containing a diagram containing a link, with its 'from' and and 'to' properties set

assert_checkequal(b.model.rpar.objs(1).from, [3 3 0]);
assert_checkequal(b.model.rpar.objs(1).to, [5 2 1]);

// Check that all the model items are freed
clear b d

// create a valid diagram
d = scicos_diagram(objs=list( ..
CONST_m("define"), ..
TRASH_f("define"), ..
CLOCK_c("define"), ..
scicos_link(from=[1 1 0],to=[2 1 1]), ..
scicos_link(from=[3 1 0],to=[2 1 1],ct=[5,-1])));

// update a parameter and reinsert
o = d.objs(1);
o.graphics.exprs = "3";
o.model.rpar = 3
scicos_log("TRACE");
d.objs(1) = o;

assert_checkequal(d.objs(1).graphics.pout, 4);
assert_checkequal(d.objs(2).graphics.pin, 4);

assert_checkequal(d.objs(3).graphics.peout, 5);
assert_checkequal(d.objs(2).graphics.pein, 5);

// Check that all the model items are freed
clear

