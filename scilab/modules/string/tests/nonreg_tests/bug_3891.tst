// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3891 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3891
//
// Short description:
// strsubst() replaces the wrong characters with the regexp mode and when the subject contains backslahes (windows path for example)
//==============================================================

p = "D:\compilation_chain_master\sci_compil\scilab-master-1230554708\modules\core\macros\getshell.sci";
ref = "D:\compilation_chain_master\sci_compil\scilab-master-1230554708\modules\core\macros\getshell.bin";
r = strsubst(p, "/\.sci$/", '.bin', 'r');
if r <> ref then pause,end

p = '.sci.sci.sci';
ref = '.sci.sci.bin';
r = strsubst(p, "/\.sci$/", '.bin', 'r');
if r <> ref then pause,end

p = '\';
ref = '.bin';
r = strsubst(p, "/\\/", '.bin', 'r');
if r <> ref then pause,end
