// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1736 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1736
//
// <-- Short Description -->
//    Actually this is the same bug as 608, but it has been 
//    marked incorrectly as RESOLVED. The fix should be the 
//    same I posted some years ago for version 2.7 and I'm 
//    surprised it hasn't be applied a lot of years after it 
//    has been indentified and posted a bug correction... There 
//    is a problem with uint8 comparisons...

a = uint8(rand(10,10)*100);
if (a<=50)<>(50>=a) then pause,end
