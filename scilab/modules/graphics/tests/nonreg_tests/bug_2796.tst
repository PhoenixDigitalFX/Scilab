// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - INRIA - Jean-Baptiste Silvy
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2796 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2796
//
// <-- Short Description -->
// There is a variable named k equals to 1 when a function f is evaluated when
// plotting with plot(x,f).

k = 42;

function r=f(x),
  // check that k is still 42
  if (k <> 42) then pause, end
  r=x;
endfunction

x=linspace(0,1,6);
// plot will evaluate f
plot(x,f)

