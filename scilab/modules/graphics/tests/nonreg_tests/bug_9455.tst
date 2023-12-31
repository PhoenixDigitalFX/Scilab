// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 9455 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9455
//
// <-- Short Description -->
// The contourf and contourf 2 demos displayed unwanted dots.

contourf();
a = gca();
for k=1:size(a.children, "*")
  if a.children(k).type == "Legend" then pause; end
end

sleep(3000);//Wait for MVC update
delete(gcf());
