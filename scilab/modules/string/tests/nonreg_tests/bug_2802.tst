// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
// Copyright (C) 2014 - Scilab Enterprises - Clement DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- LINUX ONLY -->

// <-- Non-regression test for bug 2802 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2802
//
// <-- Short Description -->
//    convstr() doesn't work if the string contains accented characters.
// The returned string is cut before the first accented character.

ref  = "Bug convstr : Génération de l"+ascii(39)+"aide";
refl = "bug convstr : génération de l"+ascii(39)+"aide";
refu = "BUG CONVSTR : GÉNÉRATION DE L"+ascii(39)+"AIDE";

resl = convstr(ref,"l");
if refl <> resl then pause,end

resu = convstr(ref,"u");
if refu <> resu then pause,end

if convstr("é","u") <> "É" then pause,end

