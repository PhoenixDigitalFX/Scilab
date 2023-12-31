//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA -Serge.Steer@inria.fr
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 6792 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6792
//
// <-- Short Description -->
// mis-interpretation of macro arguments when the macro call appears in an list extraction
function [x,y]=fun(varargin), x=varargin,y=size(varargin),endfunction
function y=%foo_e(name,ml),y=fun,endfunction
function y=%bar_e(name,ml),y=type,endfunction

M=mlist(['foo']);
N=mlist(['bar']);
M1=mlist(['foo','meth'],fun);

[x,y]=M.meth(['hello' 'world']);
if or(x<>list(['hello' 'world']))|y<>1 then pause,end
[x,y]=M1.meth(['hello' 'world']);
if or(x<>list(['hello' 'world']))|y<>1 then pause,end

[x,y]=M.meth('xx',list(1,2,3));
if or(x<>list('xx',list(1,2,3)))|y<>2 then pause,end

[x,y]=M1.meth('xx',list(1,2,3));
if or(x<>list('xx',list(1,2,3)))|y<>2 then pause,end

[x,y]=M.meth('xx',1,2,3);
if or(x<>list('xx',1,2,3))|y<>4 then pause,end

[x,y]=M1.meth('xx',1,2,3);
if or(x<>list('xx',1,2,3))|y<>4 then pause,end

// extraction returns a built-in
t=N.foo(123);
if (t<>1) then pause, end
t=N.foo(['a' 'b']);
if (t<>10) then pause, end