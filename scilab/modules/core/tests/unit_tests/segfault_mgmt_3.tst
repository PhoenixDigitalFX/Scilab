// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Paul Bignier
// Copyright (C) 2011 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- NO CHECK ERROR OUTPUT -->
//
// <-- CLI SHELL MODE -->
//
// <-- UNIX ONLY -->

ilib_verbose(0);
curDir = pwd();
cd TMPDIR;

fd = mopen("test_script3.sce", "wt");

txt = [
"cd TMPDIR;"
"f3 = [""typedef void(*FUNC)(void);"""
"""int ext3c(int *n, double *a_, double *b, double *c)"""
"""{"""
"""    const static unsigned char insn[4] = { 0xff, 0xff, 0xff, 0xff };"""
"""    FUNC function = (FUNC) insn;"""
"""    function();"""
"""    return 0;"""
"""}""];"
""
"mputl(f3, ""fun3.c"");"
""
"libname = ilib_for_link(""ext3c"", ""fun3.c"", [], ""c"", [], ""loader.sce"", ""test"");"
"refname = ""libtest"" + getdynlibext();"
"assert_checkequal(refname, libname);"
"exec(""loader.sce"");"
""
"n = 3;"
"a = [1 2 3];"
"b = [4 5 6];"
"call(""ext3c"", n,1,""i"", a,2,""d"", b,3,""d"", ""out"",[1 3],4,""d"");"
];

mputl(txt, fd);
mclose(fd);

err = unix(SCI+"/bin/scilab-cli -f ""test_script3.sce""");
if err == 0 then pause, end

