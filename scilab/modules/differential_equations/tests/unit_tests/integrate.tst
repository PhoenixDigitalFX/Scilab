// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// integrate.tst --
//   Unit tests for integrate.

// Test #1 : example from the doc
x0 = 0;
x1=0:0.1:2*%pi;
computed = integrate('sin(x)','x',x0,x1);
expected = 1 - cos(x1);
if (norm(computed-expected) > 10* %eps) then pause,end

