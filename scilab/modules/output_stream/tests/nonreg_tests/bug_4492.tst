// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug4492 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4492
//
// output_stream_gateway.xml was not include in windows binary.

if funptr('msprintf') == 0 then pause,end

