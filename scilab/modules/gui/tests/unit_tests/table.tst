// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - Han DONG
// Copyright (C) 2012 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// Unitary tests for Scilab 'table' uicontrol

// Exec tests common to all uicontrols
clear uicontrol_generic_test
exec("SCI/modules/gui/tests/unit_tests/uicontrol_generic_test.sci");
if uicontrol_generic_test("table") <> 0 then pause; end

// Regular testing of table in uicontrol
h = uicontrol("style", "table", "position", [0 0 300 300]);
set(h, "string", ["0", "1", "2", "3", "4", "5";..
                  "", "a", "b", "c", "d", "e";..
                  "", "0", "10" "1.2", "3.2", "43.3"]);

// TODO test with wrong values

// Test set functions for uicontrol
h = uicontrol(gcf(), "style", "table");
set(h, "position", [0 20 400 200]);
set(h, "string", ["Corner", "C1-header", "C2-header", "C3-header", "C4-header", "C5-header";..
                  "R1-header", "R1C1", "R1C2", "R1C3", "R1C4", "R1C5";..
                  "R2-header", "R2C1", "R2C2", "R2C3", "R2C4", "R2C5";..
                  "R3-header", "R3C1", "R3C2", "R3C3", "R3C4", "R3C5"]);

h = uicontrol(gcf(), "style", "table");
set(h, "position", [0 20 400 200]);
set(h, "string", ["0", "1", "2", "3", "4", "5";..
                  "r1", "a", "x", "y", "d", "1.2";..
                  "r2", "1.2", "3.2", "43.3", "0", "0.3"]);

h = uicontrol("parent", gcf(), "style", "table");
set(h, "position", [0 20 400 200]);
set(h, "string", ["", "c1", "c2", "c3", "c4", "c5";..
                  "", "a", "x", "y", "d", "1.2";..
                  "", "1.2", "3.2", "43.3", "0", "0.3";..
                  "", "x", "y", "z", "w", "c";..
                  "", "1", "2", "3", "4", "5"]);
h.enable="off";
h.enable="on";
