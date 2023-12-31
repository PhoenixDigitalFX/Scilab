// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->
// <-- XCOS TEST -->

// Import diagram
assert_checktrue(importXcosDiagram("SCI/modules/xcos/tests/unit_tests/Integer/samphold.zcos"));

Zero = zeros(71, 1);
MinusOne   = -1*ones(4, 1);
MinusTwo   = -2*ones(5, 1);
MinusThree = -3*ones(5, 1);
MinusFour  = -4*ones(8, 1);

A_ref = int32([MinusFour; MinusThree; MinusTwo; MinusOne; Zero; MinusOne; MinusTwo; MinusThree; MinusFour]);

try scicos_simulate(scs_m, 'nw'); catch disp(lasterror()); end

assert_checkequal(A.values, A_ref);
