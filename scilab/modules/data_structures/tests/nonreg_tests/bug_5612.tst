// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 5612 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/5612
//
// <-- Short Description -->
// There is no way for deleting a structure field.

s = struct("txt","Hello","num",%pi,"pol",%z^2+1);

if or(getfield(1,s)<>["st", "dims", "txt", "num", "pol"]) then pause; end

// Delete the field called 'num'
s.num = null();

// Check that 'num' field has been deleted
if or(getfield(1,s)<>["st", "dims", "txt", "pol"]) then pause; end

// Check that remaining fields have the right value
if s.txt<>"Hello" then pause; end
if s.pol<>%z^2+1 then pause; end


