// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2010 - DIGITEO 
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
ilib_verbose(0);
mkdir(pathconvert(TMPDIR+"/integer_reading_api"));
cd(pathconvert(TMPDIR+"/integer_reading_api"));
copyfile(SCI+"/modules/api_scilab/tests/unit_tests/integer_reading_api.c",pathconvert(TMPDIR+"/integer_reading_api/integer_reading_api.c",%F));
cflags = "-I"+SCI+"/modules/localization/includes";
ilib_build("integer_reading",["read_integer","read_integer"],"integer_reading_api.c",[],"","",cflags);
exec("loader.sce");

a8  = int8([    1   -2  3   -4  5; ..
                -6  7   -8  9   -10; ..
                11  -12 13  -14 15]);
au8 = uint8([   1   2   3   4   5; ..
                6   7   8   9   10; ..
                11  12  13  14  15]);
a16  = int16([  1   -2  3   -4  5; ..
                -6  7   -8  9   -10; ..
                11  -12 13  -14 15]);
au16 = uint16([ 1   2   3   4   5; ..
                6   7   8   9   10; ..
                11  12  13  14  15]);
a32 = int32([   1   -2  3   -4  5; ..
                -6  7   -8  9   -10; ..
                11  -12 13  -14 15]);
au32 = uint32([ 1   2   3   4   5; ..
                6   7   8   9   10; ..
                11  12  13  14  15]);
[c8, cu8, c16, cu16, c32, cu32] = read_integer(a8, au8, a16, au16, a32, au32);
if or(c8 <> a8 * 2) then pause;end
if or(cu8 <> au8 * 4) then pause;end
if or(c16 <> a16 * 8) then pause;end
if or(cu16 <> au16 * 16) then pause;end
if or(c32 <> a32 * 32) then pause;end
if or(cu32 <> au32 * 64) then pause;end
