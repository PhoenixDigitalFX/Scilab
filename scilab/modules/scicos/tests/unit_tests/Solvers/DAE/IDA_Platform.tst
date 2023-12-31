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

ilib_verbose(0); //to remove ilib_* traces

// Import diagram
assert_checktrue(importXcosDiagram("SCI/modules/xcos/tests/unit_tests/Solvers/DAE/Platform.zcos"));

IDA_val_ref = [ 11.
11.
11.
7.1057377
4.2276434
3.7837192
2.9538128
5.8771057
6.3928885
7.7794415
8.7234525
8.1656745
5.4692996
4.119467
3.98566
4.5880334
6.2619705
7.460788
8.0411235
7.0316339
5.9103864
5.0870516
4.8350387
5.2736793
6.0991627
6.8411039
7.22751
6.791484
6.0262625
5.4580017
5.3754978
5.5876889
6.078075
6.5118764
6.6403792
6.4498018
6.0902532
5.7053277
5.6308887
5.8353956 ];
IDA_time_ref = (0:.5:19.5)';

scs_m.props.tol(6) = 100; // Solver
scs_m.props.context = "per = 0.5"; // Period, to get more varied results
scicos_simulate(scs_m);   // IDA

assert_checkalmostequal(res.values, IDA_val_ref, [], 1d-6);
assert_checkalmostequal(res.time, IDA_time_ref);
