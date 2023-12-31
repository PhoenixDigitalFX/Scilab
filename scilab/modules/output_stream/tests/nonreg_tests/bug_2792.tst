// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2792 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2792
//
// <-- Short Description -->
// A bug which has appeared with Scilab 5
// Erroneous display of a woarning:

warning("off")

m = 100;
n = 15;
t = (0:m-1)'/(m-1);
A = [];

for i=1:n,  A = [A t.^(i-1)]; end
b = exp(sin(4*t));
b = b/2006.7874531048527;
ierr = execstr("x1=A\b;","errcatch");
if ierr <> 0 then pause,end
