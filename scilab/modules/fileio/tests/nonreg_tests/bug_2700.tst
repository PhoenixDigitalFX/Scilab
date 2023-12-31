// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Sylvestre LEDRU <sylvestre.ledru@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2700 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2700
//
// <-- Short Description -->
//    Read 22 ( and plus ) columns matrix with fscanfMat crashes Scilab

m  = 1000;
n  = 100;
a  = rand(m,n,"u");
fd = mopen(TMPDIR+"/bug_fscanfMat","w");
for i=1:m
	for j=1:n
		mfprintf(fd,"%5.2f ",a(i,j));
	end
	mfprintf(fd,"\n");
end
mclose(fd);

A = fscanfMat(TMPDIR+"/bug_fscanfMat");

if or(size(A) <> [1000 100]) then pause, end
