// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014-2015 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

loadXcosLibs();
scicos_log("TRACE");


// Create and clone a Diagram containing a SuperBlock

// The SuperBlock, containing a Block and a Link
sb = scicos_block();
// Sub-Diagram of 'sb'
d = scicos_diagram();
// Block & Link
b = scicos_block();
b.graphics.pin = 0;
b.graphics.pout = 0;
l = scicos_link( from=[1 1 0],to=[1 1 1] ); // Connecting 'b' to itself (create two ports)

// Assembling the elements, making 'sb' a SuperBlock
d.objs(1) = b;
d.objs(2) = l;
assert_checkequal(d.objs(1).graphics.pout, 2);
assert_checkequal(d.objs(1).graphics.pin,  2);
assert_checkequal(d.objs(2).from, [1 1 0]);
assert_checkequal(d.objs(2).to,   [1 1 1]);

sb.model.rpar = d;
assert_checkequal(sb.model.rpar.objs(1).graphics.pout, 2);
assert_checkequal(sb.model.rpar.objs(1).graphics.pin,  2);
assert_checkequal(sb.model.rpar.objs(2).from, [1 1 0]);
assert_checkequal(sb.model.rpar.objs(2).to,   [1 1 1]);

// Main diagram
scs_m = scicos_diagram();
scs_m.objs(1) = sb;
assert_checkequal(scs_m.objs(1).model.rpar.objs(1).graphics.pout, 2);
assert_checkequal(scs_m.objs(1).model.rpar.objs(1).graphics.pin,  2);
assert_checkequal(scs_m.objs(1).model.rpar.objs(2).from, [1 1 0]);
assert_checkequal(scs_m.objs(1).model.rpar.objs(2).to,   [1 1 1]);

l = list(1); l(1) = scs_m; // Cloning 'scs_m'

assert_checkequal(l(1).objs(1).model.rpar.objs(1).graphics.pout, 2);
assert_checkequal(l(1).objs(1).model.rpar.objs(1).graphics.pin,  2);
assert_checkequal(l(1).objs(1).model.rpar.objs(2).from, [1 1 0]);
assert_checkequal(l(1).objs(1).model.rpar.objs(2).to,   [1 1 1]);


// Check that all the model items are freed
clear


// Relaunch Xcos librairy
loadXcosLibs();
scicos_log("TRACE");

// Try with two "BIGSOM_f" blocks connected together

// The SuperBlock, containing a Block and a Link
sb = scicos_block();
// Sub-Diagram of 'sb'
d = scicos_diagram();
// Block & Link
Sum1 = BIGSOM_f("define");
Sum2 = BIGSOM_f("define");
l = scicos_link( from=[1 1 0],to=[2 1 1] ); // Connecting 'Sum1' to 'Sum2'
// Assembling the elements, making 'sb' a SuperBlock
d.objs(1) = Sum1;
d.objs(2) = Sum2;
d.objs(3) = l;
assert_checkequal(d.objs(1).graphics.pin, [0 ; 0]);
assert_checkequal(d.objs(1).graphics.pout, 3);
assert_checkequal(d.objs(2).graphics.pin, [3 ; 0]);
assert_checkequal(d.objs(2).graphics.pout, 0);
assert_checkequal(d.objs(3).from, [1 1 0]);
assert_checkequal(d.objs(3).to, [2 1 1]);
sb.model.rpar = d;

// Main diagram
scs_m = scicos_diagram();
scs_m.objs(1) = sb;
assert_checkequal(scs_m.objs(1).model.rpar.objs(1).graphics.pin, [0 ; 0]);
assert_checkequal(scs_m.objs(1).model.rpar.objs(1).graphics.pout, 3);
assert_checkequal(scs_m.objs(1).model.rpar.objs(2).graphics.pin, [3 ; 0]);
assert_checkequal(scs_m.objs(1).model.rpar.objs(2).graphics.pout, 0);
assert_checkequal(scs_m.objs(1).model.rpar.objs(3).from, [1 1 0]);
assert_checkequal(scs_m.objs(1).model.rpar.objs(3).to, [2 1 1]);

l = list(1); l(1) = scs_m; // Cloning 'scs_m'

// Check connections
assert_checkequal(l(1).objs(1).model.rpar.objs(1).graphics.pin, [0 ; 0]);
assert_checkequal(l(1).objs(1).model.rpar.objs(1).graphics.pout, 3);
assert_checkequal(l(1).objs(1).model.rpar.objs(2).graphics.pin, [3 ; 0]);
assert_checkequal(l(1).objs(1).model.rpar.objs(2).graphics.pout, 0);
assert_checkequal(l(1).objs(1).model.rpar.objs(3).from, [1 1 0]);
assert_checkequal(l(1).objs(1).model.rpar.objs(3).to, [2 1 1]);

// Clone a second time
l2 = list(1); l2(1) = l(1); // Cloning 'l(1)', which is 'scs_m's clone

// Check connections
assert_checkequal(l2(1).objs(1).model.rpar.objs(1).graphics.pin, [0 ; 0]);
assert_checkequal(l2(1).objs(1).model.rpar.objs(1).graphics.pout, 3);
assert_checkequal(l2(1).objs(1).model.rpar.objs(2).graphics.pin, [3 ; 0]);
assert_checkequal(l2(1).objs(1).model.rpar.objs(2).graphics.pout, 0);
assert_checkequal(l2(1).objs(1).model.rpar.objs(3).from, [1 1 0]);
assert_checkequal(l2(1).objs(1).model.rpar.objs(3).to,   [2 1 1]);


// Check that all the model items are freed
clear


// Relaunch Xcos librairy
loadXcosLibs();
scicos_log("TRACE");

// Try with a predefined SuperBlock
sb = SUPER_f("define");
scs_m = scicos_diagram();
scs_m.objs(1) = sb;
l = list(1); l(1) = scs_m; // Cloning 'scs_m'

assert_checkequal(size(l(1).objs(1).model.rpar.objs), 2); // Blocks "IN_f" and "OUT_f"


// Check that all the model items are freed
clear

