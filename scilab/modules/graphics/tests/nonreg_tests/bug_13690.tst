// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 13690 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13690
//
// <-- Short Description -->
// tight_limits property could not manage X, Y and Z axis separately.

// Defaults
a=gca();
assert_checkequal(a.tight_limits, ["off" "off" "off"]);

// Change all values (old behavior)
a.tight_limits = "on";
assert_checkequal(a.tight_limits, ["on" "on" "on"]);

// Back to defaults
a.tight_limits = "off";
assert_checkequal(a.tight_limits, ["off" "off" "off"]);

// Change X-axis
a.tight_limits(1) = "on";
assert_checkequal(a.tight_limits, ["on" "off" "off"]);
a.tight_limits(1) = "off";
assert_checkequal(a.tight_limits, ["off" "off" "off"]);

// Change Y-axis
a.tight_limits(2) = "on";
assert_checkequal(a.tight_limits, ["off" "on" "off"]);
a.tight_limits(2) = "off";
assert_checkequal(a.tight_limits, ["off" "off" "off"]);

// Change Z-axis
a.tight_limits(3) = "on";
assert_checkequal(a.tight_limits, ["off" "off" "on"]);
a.tight_limits(3) = "off";
assert_checkequal(a.tight_limits, ["off" "off" "off"]);

// Change all at once
a.tight_limits = ["on" "on" "on"];
assert_checkequal(a.tight_limits, ["on" "on" "on"]);
a.tight_limits = ["off" "off" "off"];
assert_checkequal(a.tight_limits, ["off" "off" "off"]);

// Save/load
a=gca();
a.tight_limits = ["off" "on" "off"];
save(TMPDIR + filesep() + "bug_13690.sod", "a");
clear a
load(TMPDIR + filesep() + "bug_13690.sod");
assert_checkequal(a.tight_limits, ["off" "on" "off"]);
