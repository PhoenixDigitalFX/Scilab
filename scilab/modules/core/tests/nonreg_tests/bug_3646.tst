//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3646 -->
// <-- NO CHECK REF -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3646
//
// <-- Short Description -->
// Scilab 5.0.2 does not start after installation

if getos() == 'Windows' then

  cd(TMPDIR);
  mkdir('Lukáš Bùôl');
  path_directory = cd('Lukáš Bùôl');
  prv_APPDATA = getenv('APPDATA');
  
  // set APPDATA to find another SCIHOME
  setenv('APPDATA', path_directory);
  
  res = unix('scilab -e quit');
  assert_checkequal(res, 0);
  
  // restore previous env. variables
  setenv('APPDATA',prv_APPDATA);

end
