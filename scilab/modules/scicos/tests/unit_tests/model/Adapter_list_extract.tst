// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// Use lists to extract Xcos objects' fields
loadXcosLibs();


// With a diagram
scs_m = scicos_diagram();

lTf = list("props", "tf");
assert_checkequal(scs_m(lTf), 30);

lObjs  = list("objs");
assert_checkequal(scs_m(lObjs),  list());


// With a link
Link = scicos_link();

lXX   = list("xx");
lFrom = list("from");
assert_checkequal(Link(lXX),   []);
assert_checkequal(Link(lFrom), [0 0 0]);


// With a block
Sum = BIGSOM_f("define");
g = Sum.graphics;
m = Sum.model;

lGraphics = list("graphics");
lModel    = list("model");
assert_checkequal(Sum(lGraphics), g);
assert_checkequal(Sum(lModel),    m);

// Try various 'model' fields
lIn    = list("model", "in");
assert_checkequal(Sum(lIn),   [-1;-1]);
lOds   = list("model", "odstate");
assert_checkequal(Sum(lOds),  list());
lRpar  = list("model", "rpar");
assert_checkequal(Sum(lRpar), [1;1]);
lBtype = list("model", "blocktype");
assert_checkequal(Sum(lBtype), "c");
lDepUT = list("model", "dep_ut");
assert_checkequal(Sum(lDepUT), [%t,%f]);


// With a superblock
scs_m.objs(1) = Sum;
super = scicos_block();
super.model.rpar = scs_m;

lSubGraphics = list("model", "rpar", "objs", 1, "graphics");
lSubModel    = list("model", "rpar", "objs", 1, "model");
assert_checkequal(super(lSubGraphics), g);
assert_checkequal(super(lSubModel),    m);
