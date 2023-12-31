// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13351 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13351
//
// <-- Short Description -->
// xstringb failed with LaTeX code

str=["Scilab" "is";"$\sqrt{not}$" "elisaB"];
plot2d(0,0,[-1,1],"010"," ",[0,0,1,1]);

r=[0,0,1,0.5];
xstringb(r(1),r(2),str,r(3),r(4),"fill");
xrect(r(1),r(2)+r(4),r(3),r(4));

r=[r(1),r(2)+r(4)+0.01,r(3),r(4)/2];
xrect(r(1),r(2)+r(4),r(3),r(4))
xstringb(r(1),r(2),str,r(3),r(4),"fill");