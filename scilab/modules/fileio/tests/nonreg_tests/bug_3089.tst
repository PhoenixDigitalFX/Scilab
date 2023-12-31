// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// <-- Non-regression test for bug 3089 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3089
//
// <-- Short Description -->
// chdir seems to have problems with directory names containing nordic characters like æ ø and å.

newdir = TMPDIR + filesep() +'æøå_dir';
r = removedir(newdir);
if r <> %f then pause,end

r = mkdir(newdir);
if r <> 1 then pause,end

r = cd(newdir);
if r == [] then pause,end

r = chdir(newdir);
if r <> %t then pause,end

r = chdir(TMPDIR);
if r <> %t then pause,end

r = removedir(newdir);
if r <> %t then pause,end


