// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 8763 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8763
//
// <-- Short Description -->
// ATOMS installation path was shared on Windows 64 with 32 bits

load("SCI/modules/atoms/macros/atoms_internals/lib");
pathInstall = atomsPath("install", "all");
pathSystem = atomsPath("system", "all");

if getos() <> "Windows" then
  ref_pathSystem = [pathconvert(SCI + "/.atoms"); pathconvert(SCIHOME + "/.atoms")];
  ref_pathInstall =  [pathconvert(SCI + "/contrib"); pathconvert(SCIHOME + "/atoms")];
else
  if win64() then
    ref_pathSystem = [pathconvert(SCI + "/.atoms"); pathconvert(SCIHOME + "/.atoms/x64")];
    ref_pathInstall =  [pathconvert(SCI + "/contrib"); pathconvert(SCIHOME + "/atoms/x64")];
  else
    ref_pathSystem = [pathconvert(SCI + "/.atoms"); pathconvert(SCIHOME + "/.atoms")];
    ref_pathInstall =  [pathconvert(SCI + "/contrib"); pathconvert(SCIHOME + "/atoms")];
  end
end

assert_checkequal(pathInstall, ref_pathInstall);
assert_checkequal(ref_pathSystem, ref_pathSystem);
