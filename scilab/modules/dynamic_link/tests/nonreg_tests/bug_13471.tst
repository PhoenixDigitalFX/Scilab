// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Simon MARCHETTO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 13471 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13471
//
// <-- Short Description -->
// Infinite loop in ilib_build_jar used on an empty dir
//

ilib_verbose(0);
originalDir = pwd();
cd(TMPDIR);
emptyDir = fullfile(TMPDIR, 'emptyDir');
mkdir(emptyDir);
jarPath = fullfile(TMPDIR, 'emptyDir.jar');
ierr = execstr('ilib_build_jar(jarPath, ''emptyDir'', emptyDir)', 'errcatch');
cd(originalDir);
assert_checkequal(ierr, 0);
assert_checktrue(isfile(jarPath));
