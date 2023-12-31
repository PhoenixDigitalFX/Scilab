// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 2198 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2198
//
// <-- Short Description -->
//    Many uicontrols are created with default properties, but return [] when inquired.

// Java version of uicontrol solves this problem

f = figure(1);

h1 = uicontrol(f,"style","pushbutton");

if isempty(get(h1,"backgroundcolor")) then pause; end

h2 = uicontrol(f,"style","text","string","abaoaqu");
if isempty(get(h2,"position")) then pause; end

h3 = uicontrol(f,"style","checkbox");
if isempty(get(h3,"position")) then pause; end
