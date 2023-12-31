// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 5486 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/5486
//
// <-- Short Description -->
// help_from_sci function didn't handle text in link
pp = get_function_path("prettyprint");
// No regression
out = help_from_sci(pp);
if find(strstr(out, "<link linkend=""math_rendering_features_in_graphic"">math_rendering_features_in_graphic</link>") <> "") == [] then pause, end;
// Feature added
tmpfile = TMPDIR + "/bug_5486.sci";
str = mgetl(pp);
str = strsubst(str, "math_rendering_features_in_graphic", "math_rendering_features_in_graphic LaTeX or MathML expression");
mputl(str, tmpfile);
out = help_from_sci(tmpfile);
if find(strstr(out, "<link linkend=""math_rendering_features_in_graphic"">LaTeX or MathML expression</link>") <> "") == [] then pause, end;
