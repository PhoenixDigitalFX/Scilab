// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 10506 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10506
//
// <-- Short Description -->
// ssprint did not check input arguments
//

a = [1 1;0 1];
b = [0 1;1 0];
c = [1, 1];
d = [3, 2];
S = syslin('c', a, b, c, d);
out = [TMPDIR + 'out_10506_1.txt'; TMPDIR + 'out_10506_2.txt'];

msgerr = msprintf(gettext("%s: Wrong number of input argument(s).\n"), "ssprint");
assert_checkerror("ssprint()", msgerr);

msgerr = msprintf(gettext("%s: Wrong size for input argument #%d: A character string expected.\n"), "ssprint", 2);
assert_checkerror("ssprint(S, out)", msgerr);

msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: A character string expected.\n"), "ssprint", 2);
assert_checkerror("ssprint(S, 1)", msgerr);

msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: A state-space model expected.\n"), "ssprint", 1);
assert_checkerror("ssprint(ones(3,3))", msgerr);


