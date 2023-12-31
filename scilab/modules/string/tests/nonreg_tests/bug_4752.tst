// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 -INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4752 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4752
//
// Short description:
// sci2exp produces erroneous code when applied to boolean matrices (; are missing)


a=[%f,%f,%f;%f,%f,%t];
if sci2exp(a)<>'[%f,%f,%f;%f,%f,%t]' then pause,end
if sci2exp(a,0)<>'[%f,%f,%f;%f,%f,%t]' then pause,end

