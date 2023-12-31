// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 10450 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10450
//
// Allows overloading for gamma, dlgamma and gammaln functions for list, tlist, 
// mlist and hypermatrices types. 

msgerr = msprintf(gettext("Function not defined for given argument type(s),\n"));

l = list(1, 2);
assert_checkerror("dlgamma(l)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%l_dlgamma")]);
assert_checkerror("gammaln(l)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%l_gammaln")]);
assert_checkerror("gamma(l)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%l_gamma")]);

tl =  tlist(["mytlist", "field1", "field2"], [], []);
assert_checkerror("dlgamma(tl)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%mytlist_dlgamma")]);
assert_checkerror("gammaln(tl)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%mytlist_gammaln")]);
assert_checkerror("gamma(tl)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%mytlist_gamma")]);

ml = mlist(['mymlist','name','value'],['a','b';'c' 'd'],[1 2; 3 4]);
assert_checkerror("dlgamma(ml)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%mymlist_dlgamma")]);
assert_checkerror("gammaln(ml)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%mymlist_gammaln")]);
assert_checkerror("gamma(ml)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%mymlist_gamma")]);

n(1, 1, 1, 1:2) = [1 2];
assert_checkerror("dlgamma(n)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%hm_dlgamma")]);
assert_checkerror("gammaln(n)", [msgerr; msprintf(gettext("  check arguments or define function %s for overloading.\n"), "%hm_gammaln")]);

function Y = %l_dlgamma(X),  Y = %T; endfunction
function Y = %l_gammaln(X),  Y = %T; endfunction
function Y = %l_gamma(X),  Y = %T; endfunction
l = list(1, 2);
assert_checkequal(dlgamma(l), %T);
assert_checkequal(gammaln(l), %T);
assert_checkequal(gamma(l), %T);

function Y = %mytlist_dlgamma(X),  Y = %T; endfunction
function Y = %mytlist_gammaln(X),  Y = %T; endfunction
function Y = %mytlist_gamma(X),   Y = %T; endfunction
tl =  tlist(["mytlist", "field1", "field2"], [], []);
assert_checkequal(dlgamma(tl), %T);
assert_checkequal(gammaln(tl), %T);
assert_checkequal(gamma(tl), %T);

function Y = %mymlist_dlgamma(X),   Y = %T; endfunction
function Y = %mymlist_gammaln(X),  Y = %T; endfunction
function Y = %mymlist_gamma(X),  Y = %T; endfunction
ml = mlist(['mymlist','name','value'],['a','b';'c' 'd'],[1 2; 3 4]);
assert_checkequal(dlgamma(ml), %T);
assert_checkequal(gammaln(ml), %T);
assert_checkequal(gamma(ml), %T);

function Y = %hm_dlgamma(X),   Y = %T; endfunction
function Y = %hm_gammaln(X),   Y = %T; endfunction
n(1, 1, 1, 1:2) = [1 2];
assert_checkequal(dlgamma(n), %T);
assert_checkequal(gammaln(n), %T);
