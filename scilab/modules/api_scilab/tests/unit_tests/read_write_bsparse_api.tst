// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2010 - DIGITEO 
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
ilib_verbose(0);
mkdir(pathconvert(TMPDIR+"/read_write_bsparse_api"));
cd(pathconvert(TMPDIR+"/read_write_bsparse_api"));
copyfile(SCI+"/modules/api_scilab/tests/unit_tests/read_write_bsparse_api.c",pathconvert(TMPDIR+"/read_write_bsparse_api/read_write_bsparse_api.c",%F));
cflags = "-I"+SCI+"/modules/localization/includes";
ilib_build("gw_read_write_bsparse",["read_write_bsparse","read_write_bsparse"],"read_write_bsparse_api.c",[],"","",cflags);
exec("loader.sce");

a = sparse([%t, %f, %t ; %f, %t, %f ; %t, %f, %t]);
a_ref = sparse([%f, %t, %f ; %t, %f, %t ; %f, %t, %f]);
b = read_write_bsparse(a);
if or(b <> a_ref) then pause;end
