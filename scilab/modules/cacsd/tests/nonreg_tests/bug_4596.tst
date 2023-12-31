// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4596 -->
//
//<-- CLI SHELL MODE -->
//<-- NO CHECK REF -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4596
//
// <-- Short Description -->
//   g_margin fails to return the gain margins in some cases.

s=%s;
K=485000.;
h=syslin('c', K / ( s * (s+100)^2 ) );

[gm,fr]=g_margin(h)
if gm==[] then pause,end
if abs(2*%pi*fr-100)>100*%eps then pause,end
