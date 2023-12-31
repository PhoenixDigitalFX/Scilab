// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 9052 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9052
//
// <-- Short Description -->
// All demos in graphics/animations are automatically closed at the end of each one

close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim1","anim1.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim2","anim2.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim3","anim3.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim4","anim4.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim5","anim5.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim6","anim6.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim7","anim7.sce");
exec(path_demo,-1);
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","anim8","anim8.sci");
exec(path_demo,-1);
demo_riemann();
assert_checkequal(winsid(), 100001);
close(winsid());
path_demo = fullfile(SCI,"modules","graphics","demos","anim","bubbleSort","bubbleSort.sci");
exec(path_demo,-1);
demo_bubbleSort();
assert_checkequal(winsid(), 100001);
