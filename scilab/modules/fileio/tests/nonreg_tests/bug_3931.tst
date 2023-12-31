// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3931 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3931
//
// <-- Short Description -->
// fileparts returns incorrect value with some special  description of the filename

[a1, b1, c1] = fileparts(TMPDIR+'/.test');
if a1 <> TMPDIR + filesep() then pause,end
if b1 <> '.test' then pause,end
if c1 <> '' then pause,end

[a2, b2, c2]=fileparts(TMPDIR+'/.test.ext');
if a2 <> TMPDIR + filesep() then pause,end
if b2 <> '.test' then pause,end
if c2 <> '.ext' then pause,end


