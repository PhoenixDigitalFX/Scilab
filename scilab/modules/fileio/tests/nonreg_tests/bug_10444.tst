// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 10444 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10444
//
// <-- Short Description -->
// Bug #10444 fixed - fullfile did not manage string matrix as last input argument.
//

msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: a string expected.\n"), "fullfile", 2);
assert_checkerror ("r = fullfile(SCI, 3, ''scilab.start'')", msgerr);

if getos() <> "Windows" then
  REF = ['/home/scilab/macros/util/fullfile.sci';
         '/home/scilab/macros/util/toto.sci'];
else
  REF = ['\home\scilab\macros\util\fullfile.sci';
         '\home\scilab\macros\util\toto.sci'];
end

r = fullfile("/home/","\scilab","macros","\util", ["fullfile.sci"; "toto.sci"]);
assert_checkequal(r, REF);
