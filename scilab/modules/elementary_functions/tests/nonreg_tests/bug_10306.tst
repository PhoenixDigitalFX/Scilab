// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 10306 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10306
//
// <-- Short Description -->
// 'isempty' could fail with empty elements in a list
//

voidelement = list(2,,3);
assert_checkfalse(isempty(voidelement));

voidelement = list([],[],[]);
assert_checktrue(isempty(voidelement));

voidelement = list(,,,);
assert_checktrue(isempty(voidelement));

voidelement = list('','','');
assert_checktrue(isempty(voidelement));

voidelement = list(2,1,3);
assert_checkfalse(isempty(voidelement));
