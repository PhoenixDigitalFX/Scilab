// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT <vincent.couvert@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->

// Unitary tests for Scilab Java checkboxes

// Exec tests common to all uicontrols
clear uicontrol_generic_test
exec("SCI/modules/gui/tests/unit_tests/uicontrol_generic_test.sci");
if uicontrol_generic_test("checkbox") <> 0 then pause; end

// Default relief value
h = uicontrol("parent", scf(), "style", "checkbox");
if get(h, "relief") <> "flat" then pause; end

// --- Value tests ---
// Default value
if get(h, "value") <> get(h,"min") then pause; end

set(h, "value", [1]); // max
if get(h, "value") <> 1 then pause; end

// Should return an error
//set(h, "value", [1 2 3]);
//if ~and(get(h, "value") == [1 2 3]) then pause; end

//set(h, "value", []);
//if ~isempty(get(h, "value")) then pause; end

// TODO test with wrong values
delete("all")