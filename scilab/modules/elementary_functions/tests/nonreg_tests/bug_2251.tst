// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2251 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2251
//
// <-- Short Description -->
// The "isempty()" function fails to check the emptyness of variable 
// of "list"-type which contains some items of "mlist"-type if the "size"-
// operator was not defined on this "mlist".
// Accordingly to the help information about isempty(x)
// "isempty(x) returns true if x is an empty matrix or an empty list."
// Seems it is not reasonable to force any operator definitions on mlist
// contained in list for simple ability to only check the list emptyness...

// define some mlist
someml = mlist(['VVVV','smf'],[1 2 3]);

// define some list containing mlist
somels = list(someml);

// check
if isempty(somels) <> %F then pause,end
