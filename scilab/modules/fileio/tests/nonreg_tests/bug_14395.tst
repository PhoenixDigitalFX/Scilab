// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Pierre-Aimé AGNEL
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 14395 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14395
//
// <-- Short Description -->
//    %dir_p on a directory with no subdir yielded a warning operation +

is_created = createdir("TMPDIR/test_dir");
if ( is_created ) then
    fd = mopen("TMPDIR/test_dir/testfile.txt", "w");
    mputl("this is a test", fd);
end

warning_mode = warning("query");
warning("stop");
ierr = 0;
try
    res = dir("TMPDIR/test_dir"); // no sub_dir
    disp(res);
catch
    ierr = 1;
end
assert_checkequal(ierr, 0);
warning(warning_mode);

