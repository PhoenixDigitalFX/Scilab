// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- NOT FIXED -->
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 7019 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7019
//
// <-- Short Description -->
// resume() produces an error instead of beeing equivalent to resume

mputl(["y=33;";"resume()";"y=44"],TMPDIR+"/bug7019.sce");
if execstr("exec(TMPDIR+""/bug7019.sce"")","errcatch")<>46 then pause,end
if y<>33 then pause,end



if execstr("y=2;resume();y=-1",'errcatch')<>46 then pause,end
if y<>2  then pause,end
function y=foo()
y=1
return()
y=2
endfunction

if execstr("foo()","errcatch")<>46 then pause,end
