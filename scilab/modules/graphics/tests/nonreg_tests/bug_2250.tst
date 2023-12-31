// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 2250 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2250
//
// <-- Short Description -->
//   I can not save or load user_data of a figure to or from a file

f = scf(11);
plot2d();

backgroundvariable = 5;
f.background = backgroundvariable;

userdatavariable = ["my user_data - entry will not be saved, - but i.e. the backgroundvariable will be saved."];

f.user_data = userdatavariable;

save(pathconvert(TMPDIR+"/bug_2250.scg",%f), "f");

delete(f)

load(pathconvert(TMPDIR+"/bug_2250.scg",%f));

figureloaded = gcf();

if figureloaded.background<>backgroundvariable then pause; end

if figureloaded.user_data<>userdatavariable then pause;end
