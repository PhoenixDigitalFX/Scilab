// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3410 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3410
//
// <-- Short Description -->

if length(sparse(eye(2,2))) <> 4 then pause,end
if length(sparse(eye(12,2))) <> 24 then pause,end
if length(sparse(eye(2,12))) <> 24 then pause,end
if length(sparse(1)) <> 1 then pause,end
