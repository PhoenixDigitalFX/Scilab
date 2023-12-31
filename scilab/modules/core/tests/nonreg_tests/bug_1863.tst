// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- NOT FIXED -->
// <-- Non-regression test for bug 1863 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1863
//
// <-- Short Description -->
//Incomplete if while select (missing first expression are not well handled
pb=%f
try        
  function foo
    if
    end
  endfunction
catch
  pb=%t
end
if ~pb  then pause,end

pb=%f
try        
  function foo1
    while
    end
  endfunction
catch
  pb=%t
end
if ~pb  then pause,end

pb=%f
try        
  function foo2
    select
    end
  endfunction
catch
  pb=%t
end
if ~pb  then pause,end

