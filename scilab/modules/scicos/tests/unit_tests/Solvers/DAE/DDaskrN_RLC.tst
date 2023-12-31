// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->
//
// <-- XCOS TEST -->

ilib_verbose(0); //to remove ilib_* traces

// Import diagram
assert_checktrue(importXcosDiagram("SCI/modules/xcos/tests/unit_tests/Solvers/DAE/RLC.zcos"));

for i=2:3

    // Start by updating the clock block period (sampling)
    scs_m.props.context = "per = 5*10^-"+string(i);

    // Modify solver + run DDaskr + save results
    scs_m.props.tol(6) = 101;     // Solver
    scicos_simulate(scs_m); // DDaskr
    ddaskrval = res.values;       // Results

    // Modify solver + run IDA + save results
    scs_m.props.tol(6) = 100;     // Solver
    scicos_simulate(scs_m); // IDA
    idaval = res.values;          // Results

    // Compare results
    compa = abs(ddaskrval-idaval);

    // Extract mean, standard deviation, maximum
    mea = mean(compa);
    [maxi, indexMaxi] = max(compa);
    stdeviation = stdev(compa);

    // Verifying closeness of the results
    assert_checktrue(maxi <= 10^-(i+4));
    assert_checktrue(mea <= 10^-(i+4));
    assert_checktrue(stdeviation <= 10^-(i+4));

end
