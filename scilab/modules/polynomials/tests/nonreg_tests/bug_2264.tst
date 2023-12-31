// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2264 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2264
//
// <-- Short Description -->
//    lcm gives wrong value for 3-element vectors(cf bug 666)

[q,fact]=lcm(int32([-6 5 7 12 4]));
if q<>int32(420) then pause,end

[q,fact]=lcm(int32([6 5 7 3 4])) ;
if q<>int32(420) then pause,end

[q,fact]=lcm(int32([-6 5 1 3 4]));
if q<>int32(60) then pause,end

[q,fact]=lcm(int32([-6 5 0 3 4]));
if q<>int32(0) then pause,end
