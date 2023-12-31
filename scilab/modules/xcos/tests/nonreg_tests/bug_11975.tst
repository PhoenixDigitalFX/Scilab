// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Alexandre HERISSE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 11975 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12975
//
// <-- Short Description -->
// Some demos did not compile.

// 3 demonstration diagrams were not compiling :
// - Inverted_pendulum.zcos demonstration
// - IF_block.zcos demonstration
// - Hydraulics.zcos demonstration

ilib_verbose(0);

// Inverted_pendulum
if (~isdef("setw")) then
    exec("SCI/modules/xcos/demos/setw.sci",-1)
end
assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/demos/Inverted_pendulum.zcos"));
[cpr, ok] = xcos_compile(scs_m);
assert_checktrue(ok);

// IF_block
assert_checktrue(importXcosDiagram("SCI/modules/xcos/demos/IF_block.zcos"));
[cpr, ok] = xcos_compile(scs_m);
assert_checktrue(ok);

// Hydraulics
assert_checktrue(importXcosDiagram("SCI/modules/xcos/demos/ModelicaBlocks/Hydraulics.zcos"));
[cpr, ok] = xcos_compile(scs_m);
assert_checktrue(ok);

