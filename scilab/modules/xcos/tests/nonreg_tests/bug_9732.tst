// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 Scilab Enterprises <clement.david@scilab-enterprises.com>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 9732 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9732
//
// <-- Short Description -->
// try to compile and link a superblock

assert_checktrue(importXcosDiagram(SCI+"/modules/xcos/demos/Controller.zcos"));

// getting the SUPER_f (System) block
XX=scs_m.objs(11);

subSystem=XX.model.rpar;
assert_checkequal(subSystem.props.title(1), "System");

// Overload get_value
prot = funcprot();
funcprot(0);
scicos_getvalue = setvalue;
message = disp;
funcprot(prot);

// compile it
%scicos_prob = %f;
%scicos_context = struct();
ilib_verbose(0);
cd(TMPDIR);

ok = do_compile_superblock42(XX, [], [], %f);
assert_checktrue(ok);

