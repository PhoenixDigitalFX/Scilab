// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 6447 -->
//
// <-- CLI SHELL MODE --> 
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6447
//
// <-- Short Description -->
// unix_g() does not support properly neither UTF8 nor ANSI encoded output
// unix_g uses dos on Windows.

cd("SCI\modules\windows_tools\tests\nonreg_tests");
ref1 = "Les caractères accentués ne sont supportés pas par unix_g() lorsqu''ils sont encodés en UTF8 comme ici";

[a, b] = dos("type text_UTF8.txt");
if b <> %t then pause,end
if a <> ref1 then pause,end

[c, d] = unix_g("type text_UTF8.txt");
if d <> 0 then pause,end
if c <> ref1 then pause,end

[e, f] = dos("type text_ANSI.txt");
if f <> %t then pause,end
