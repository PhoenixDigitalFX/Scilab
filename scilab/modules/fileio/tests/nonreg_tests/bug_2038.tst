// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Allan CORNET <allan.cornet@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2038 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2038
//
// <-- Short Description -->
//    The dir command does not read properly directories different from the
//    current one.  Give the command a=dir('SubDir') (assuming SubDir exists and
//    is non empty). Then, each element of a.isdir is %f, each element of a.date
//    and a.bytes is 0.
//
//    See also
//    http://groups.google.it/group/comp.soft-sys.math.scilab/browse_thread/thread/2f81e9afd1d7d6f1/e33536bff4dc1ecf#e33536bff4dc1ecf

my_test_dir_1 = TMPDIR+"/bug_2038_dir";
my_test_dir_2 = TMPDIR+"/bug_2038_dir/bug_2038_sub_dir";

my_test_dir_1_res = mkdir(my_test_dir_1);

if my_test_dir_1_res == 0 then pause,end

if my_test_dir_1_res == 1 then
	
	cd(my_test_dir_1);
	
	my_test_dir_2_res = mkdir(my_test_dir_2);
	
	if my_test_dir_2_res == 0 then pause,end
	
	if my_test_dir_2_res == 1 then
		
		cd('..');
		
		a  = dir(my_test_dir_1);
		b  = mtlb_dir(my_test_dir_1);
		
		x  = getdate(a.date);
		cx = x(1:4);
		
		y  = getdate();
		cy = y(1:4);
		
		if ~(a.isdir) then pause,end
		if ~(b.isdir) then pause,end
		if cx <> cy   then pause,end
	end
end
