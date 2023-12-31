// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Paul Bignier
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

// Import the "with-ZC" diagram and augment the ending time
loadScicos();
loadXcosLibs();
importXcosDiagram("SCI/modules/xcos/examples/solvers/with_ZeroCrossing.zcos");
scs_m.props.tf = 30000;

// Set tolerances and select LSodar
scs_m.props.tol(1) = 1d-13;
scs_m.props.tol(2) = 1d-13;
scs_m.props.tol(6) = 0;

// Start the timer, launch the simulation and display time
tic();
try scicos_simulate(scs_m, "nw"); catch disp(lasterror()); end
t = toc();
disp("Time with rootfinding:", t);

// Import the "without-ZC" diagram and augment the ending time
importXcosDiagram("SCI/modules/xcos/examples/solvers/without_ZeroCrossing.zcos");
scs_m.props.tf = 30000;

// Set tolerances and select LSodar
scs_m.props.tol(1) = 1d-13;
scs_m.props.tol(2) = 1d-13;
scs_m.props.tol(6) = 0;

// Start the timer, launch the simulation and display time
tic();
try scicos_simulate(scs_m, "nw"); catch disp(lasterror()); end
t = toc();
disp("Time without rootfinding:", t);
