//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 141 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/141
//
// <-- Short Description -->
//    savewave crashes my machine


if execstr("savewave(TMPDIR+""/toto.WAV"", rand(1:10000), 11025);", "errcatch")<>0 then pause; end

