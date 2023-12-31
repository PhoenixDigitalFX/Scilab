// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 8087 -->
//
// <-- Short Description -->
// prettyprint didn't handle %inf and %nan

//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/8087
//

if prettyprint(%inf) <> "${\infty}$" then pause, end
if prettyprint([%inf 0  1 -%inf]) <> "${\begin{pmatrix}{\infty}&0&1&{-\infty}\cr \end{pmatrix}}$" then pause, end
if prettyprint([%inf 0; 1 -%inf]) <> "${\begin{pmatrix}{\infty}&0\cr 1&{-\infty}\cr \end{pmatrix}}$" then pause, end