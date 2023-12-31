// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2009 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4070 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4070
//
// <-- Short Description -->
//    the kb indices are negative
a=[1 3 4 6 ];
b=[2 3 -1  6];
[u,ka,kb]=union(a,b);
if or(u<>gsort([a(ka) b(kb)],'g','i')) then pause,end
