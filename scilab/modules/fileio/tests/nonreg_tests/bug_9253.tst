// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 9253 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9253
//
// <-- Short Description -->
// fscanfMat failed to read a file with some lines of text at the end
// (backward compatibility)


[r,t] = fscanfMat('SCI/modules/fileio/tests/nonreg_tests/bug_9253.csv');

t_ref = ["#" ; ..
"########################################################################################" ; ..
"#                      EPHEMERIDES DES CORPS DU SYSTEME SOLAIRE  " ; ..
"########################################################################################" ; ..
"#" ; ..
"# Asteroide  99942 Apophis" ; ..
"# Source : integration numerique" ; ..
"# Theorie planetaire INPOP08" ; ..
"# Coordonnees Moyennes J2000" ; ..
"# Centre du repere : heliocentre" ; ..
"# Perturbations relativistes, systeme de coordonnees 0" ; ..
"# Coordonnees rectangulaires ecliptiques (x, y, z)" ; ..
"#" ; ..
"########################################################################################" ; ..
"#" ; ..
"#         Date UTC               X                 Y                 Z               Distance            Xp                Yp                Zp" ; ..
"#       jour julien             ua.               ua.               ua.                 ua.             ua/j              ua/j              ua/j" ; ..
"#"];

assert_checkequal(t, t_ref);
assert_checkequal(size(r), [603 8]);
