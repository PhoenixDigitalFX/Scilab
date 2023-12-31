// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - Digiteo - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 4006 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4006
//
// <-- Short Description -->
// xlfont does not give fonts the right index.
// 

fonts = xlfont();
selected_font = fonts(1);

size_fonts = size(fonts,'*');
if size_fonts <> 11 then pause,end

r = xlfont(selected_font,0);
if r <> 0 then pause,end

fonts = xlfont();
size_fonts = size(fonts,'*');
if size_fonts <> 11 then pause,end


r = xlfont(selected_font,20);
if r <> 20 then pause,end

fonts = xlfont();
size_fonts = size(fonts,'*');
if size_fonts <> 21 then pause,end

if fonts(21) <> selected_font then pause,end
