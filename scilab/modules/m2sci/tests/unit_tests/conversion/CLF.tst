// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Vincent COUVERT <vincent.couvert@scilab.org>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- LONG TIME EXECUTION -->

// Unitary test for conversion of Matlab function: CLF

exec("SCI/modules/m2sci/tests/unit_tests/utils/m2sciTestConversionNoExe.sci", -1);

mprintf("%s\n", m2sciTestConversionNoExe("CLF"));
