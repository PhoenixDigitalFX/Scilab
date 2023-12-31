// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2019 - UTC - Stéphane MOTTELET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 16208 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/16208
//
// <-- Short Description -->
// Using 3D string matrix with old C-api gateways may crash Scilab

x=string([1 2;3 4]);x(:,:,2)=x;
assert_checkequal(gettext(x),x(:,:,1))

