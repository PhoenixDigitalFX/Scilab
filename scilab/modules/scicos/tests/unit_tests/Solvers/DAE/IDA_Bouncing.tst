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
//

loadXcosLibs();
ilib_verbose(0); //to remove ilib_* traces

// Import diagram
exec("SCI/modules/scicos/tests/unit_tests/Solvers/DAE/Bouncing.sce");

IDA_val_ref = [ 10.
11.3875
12.55
13.4875
14.2
14.6875
14.95
14.9875
14.8
14.3875
13.75
12.8875
11.8
10.4875
8.95
7.1875
5.2
2.9875
0.55
1.5647919
3.3538291
4.9178663
6.2569034
7.3709406
8.2599778
8.924015 ];
IDA_time_ref = (0:.5:49.5)';

scs_m.props.tol(6) = 100; // Solver
scs_m.props.context = "per = 0.5"; // Period, to get more varied results
scicos_simulate(scs_m);   // IDA

assert_checkalmostequal(res.values(1:26), IDA_val_ref, [], 1d-7);
assert_checkalmostequal(res.time, IDA_time_ref);
