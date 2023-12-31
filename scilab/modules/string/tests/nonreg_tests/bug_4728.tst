// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4728 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4728
//
// <-- Short Description -->
// Different result between Scilab 4.1.2 and Scilab master for strcat function
//
tab_ref = [
"世界您好",
"азеазея",
"ハロー・ワールド",
"เฮลโลเวิลด์",
"حريات وحقوق",
"תוכנית"];

assert_checkequal(strcat([ascii(0),"t"]), "t" + ascii(0));

assert_checkequal(strcat([ascii(0),"t",ascii(0)]), ascii(0) + "t" + ascii(0));

A = strcat([ascii(0),"t"]);
B = "t"+ascii(0);
C = ascii(0) + "t";

if A <> C then pause,end

sA = length(A);
assert_checkequal(sA, 1);

sB = length(B);
assert_checkequal(sB, 1);

sC = length(C);
assert_checkequal(sC, 1);

for i = 1 : size(tab_ref,"*")
    r1 = strcat([tab_ref(i),ascii(0),tab_ref(i)]);
    r2 = tab_ref(i) + ascii(0) + tab_ref(i);
    assert_checkequal(r1, r2);
end
