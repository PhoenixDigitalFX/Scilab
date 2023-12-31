// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 9250 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9250
//
// <-- Short Description -->
// mkdir should fail if we give more than one directory
//

try
  mkdir(["a", "b"])
catch
  [str,n]=lasterror();
  if n <> 10000 then pause, end
  if str <> msprintf(_("%s: Wrong size for input argument #%d: string expected.\n"), "mkdir", 1) then pause, end
end
