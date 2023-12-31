// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 4898 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4898
//
// <-- Short Description -->
// Block scifunc_block_m stored some list in model.ipar instead of model.opar.


// Check for a new block instantiation
scs_m = scifunc_block_m("define", [], []);

if scs_m.model.ipar <> 0 then pause,end;
if scs_m.model.opar <> list() then pause,end;

// Check for simulation for an old Xcos instance
status = importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_4898.zcos");
if status <> %t then pause,end;

scicos_simulate(scs_m);

block = [];
block_idx = [];
for kk = 1:length(scs_m.objs)
    o = scs_m.objs(kk);
    if typeof(o) == "Block" & o.gui == "scifunc_block_m" then
        block = o;
        block_idx = kk;
        break;
    end
end
if typeof(block) <> "Block" then pause,end;
if isempty(block.model.opar) <> %t then pause,end;


block.model.opar = block.model.ipar;
block.model.ipar = 0;
scs_m.objs(block_idx) = block;

scicos_simulate(scs_m);

if block.gui <> "scifunc_block_m" then pause,end;
if block.model.ipar <> 0 then pause,end;

