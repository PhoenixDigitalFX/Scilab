//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

ck=0.5;
r = delip([1,2],ck);
ref = [1.6857504    1.6857504 + 2.1565156*%i];
if or(size(r)<> [1 2]) then pause,end
if norm(ref-r) > 1e9 *%eps then pause,end
