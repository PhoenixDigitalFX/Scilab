// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 7080 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7080
//
// <-- Short Description -->
// Some graphics macros do not use standard error messages

f1="bar";
f2="barh";
f3="barhomogenize";
f4="getColorIndex";
f13="Sgrayplot";
f14="title";

//bar
msgerr11=msprintf(_("%s: Wrong number of input argument(s): %d to %d expected.\n"),f1,1,6);
assert_checkerror("bar(gca(),[1 2],[1 2],0.8,""blue"",""grouped"",[])", msgerr11);
msgerr12=msprintf(gettext("%s: Argument #%d: Decimal number(s) expected.\n"), f1, 2);
assert_checkerror("bar(gca(),[""s"" ""d""],[1 2 3])", msgerr12);
msgerr13=msprintf(_("%s: Arguments #%d and #%d: Incompatible sizes.\n"), f1, 1, 2);
assert_checkerror("bar([1 2],[1 2 3],0.8,""blue"")", msgerr13);

//barh
msgerr21=msprintf(_("%s: Wrong number of input argument(s): %d to %d expected.\n"),f2,1,5);
assert_checkerror("barh(gca(),[1 2],[1 2],0.8,""blue"",""grouped"")", msgerr21);
msgerr22=msprintf(gettext("%s: Wrong type for input arguments: Matrix expected for %s, %s and %s.\n"),"barh", "x", "y", "width");
assert_checkerror("barh(gca(),[""s"" ""d""],[1 2 3])", msgerr22);
msgerr23=msprintf(_("%s: Wrong size for input arguments #%d and #%d: The number of rows of argument #%d must be equal to the size of argument #%d.\n"),"bar",1, 2, 2, 1);
assert_checkerror("barh([1 2],[1 2 3],0.8,""blue"")", msgerr23);
msgerr24=msprintf(gettext("%s: Wrong type for input argument #%d: string expected.\n"),f2,5);
assert_checkerror("barh(1,2,3,4,5)",msgerr24);

//barhomogenize
msgerr31=msprintf(_("%s: Wrong number of input argument(s): %d to %d expected.\n"),f3,0,3);
assert_checkerror("barhomogenize(gca(),[1 2],[1 2],0.8,""blue"",""grouped"")", msgerr31);
msgerr32=msprintf(_("%s: Could not find any bar in the current graphic.\n"), "barhomogenize");
assert_checkerror("barhomogenize(gca(),""grouped"",3)", msgerr32);

//getColorIndex
msgerr41=msprintf(_("%s: Wrong type for input argument #%d: string expected.\n"), f4, 1);
assert_checkerror("getColorIndex(1)", msgerr41);

//Sgrayplot
msgerr131=msprintf(gettext("%s: Wrong number of input arguments: At least %d expected.\n"),"Sgrayplot",3);
assert_checkerror("Sgrayplot(1)", msgerr131);
msgerr132=msprintf(gettext("%s: Wrong type for input argument(s): Arguments #%d, #%d and #%d must be real.\n"), "Sgrayplot",1,2,3);
assert_checkerror("Sgrayplot(%i,%i,[%i,%i])", msgerr132);

//TitleLabel
msgerr141=msprintf(gettext("%s: Wrong size or type for input argument #%d: string expected.\n"),f14,1);
assert_checkerror("title(1)",msgerr141);
