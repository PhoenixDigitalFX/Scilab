//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3833 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3833
//
// <-- Short Description -->
// Assignment operator for cell structs storing matrices for indices greater than 1 overwrites all previous values and reinitialises the entries instead.
// Workaround was to extract the matrix from entries, update the matrix externally and re-assign the entire updated matrix into the specific cell entry.
// This is however not expedient when dealing with large structs and matrices.

g = cell(2,1);
g{2} = [1,2;3,4];
if or(g{2} <> [1,2;3,4]) then pause; end
g{2}(1,1) = 9;
if or(g{2} <> [9,2;3,4]) then pause; end
g{2}(1,2) = 10;
if or(g{2} <> [9,10;3,4]) then pause; end
g{2}(2,1) = 11;
if or(g{2} <> [9,10;11,4]) then pause; end
g{2}(2,2) = 12;
if or(g{2} <> [9,10;11,12]) then pause; end
g{2}(1) = 111;
if or(g{2} <> [111,10;11,12]) then pause; end
g{2}(3) = 222;
if or(g{2} <> [111,222;11,12]) then pause; end
g{2}(2) = 333;
if or(g{2} <> [111,222;333,12]) then pause; end
g{2}(4) = 444;
if or(g{2} <> [111,222;333,444]) then pause; end


