// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- WINDOWS ONLY -->
// <-- CLI SHELL MODE -->
//
// Checks dynamic link on a code using Windows SDK

source = [
"#define __USE_DEPRECATED_STACK_FUNCTIONS__"
"#include <windows.h>"
"#include <api_scilab.h>"
"int sci_getWindowsDirectory(char *fname, void* pvApiCtx)"
"{"
"    char buf[MAX_PATH];"
"    CheckRhs(0, 0);"
"    CheckLhs(0, 1);"
"    GetWindowsDirectoryA(buf, MAX_PATH);"
"    createSingleString(pvApiCtx, Rhs + 1, buf);"
"    LhsVar(1) = Rhs + 1;"
"    return 0;"
"}"
];

test_dir = fullfile(TMPDIR, 'ilib_build_win_sdk');
mkdir(test_dir);
mputl(source, fullfile(test_dir, 'ilib_build_win_sdk.c'));
orig_path = pwd();
chdir(test_dir);

ilib_verbose(0);
ilib_build("test_c_lib", ["getWindowsDirectory", "sci_getWindowsDirectory"], ["ilib_build_win_sdk.c"], []);
exec("loader.sce");

assert_checkequal(getWindowsDirectory(), getenv("WINDIR"));

chdir(orig_path);
rmdir(test_dir, 's');
