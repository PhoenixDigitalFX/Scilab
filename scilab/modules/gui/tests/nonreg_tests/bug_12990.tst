// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- INTERACTIVE TEST -->
//
// <-- Non-regression test for bug 12990 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12990
//
// <-- Short Description -->
// GED features conflict with figure events

scf();
plot([1,2], [1,2]);

// right click must not imply popupmenu
xclick()

// left click on the curve must not select it
xclick()

function my_eventhandler(win, x, y, ibut)
    if ibut==-1000 then return,end
    [x,y]=xchange(x,y,"i2f")
    gcf().info_message = msprintf("Event code %d at mouse position is (%f,%f)",ibut,x,y);
endfunction

seteventhandler("my_eventhandler");

// Left click on the curve must not select it
// Right click must not imply popupmenu

// Disable the event handler
seteventhandler("");

// Left click on the curve must select it
// Right click must imply popupmenu
