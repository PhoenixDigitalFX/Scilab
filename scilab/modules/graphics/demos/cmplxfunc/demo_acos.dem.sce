// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

// =============================================================================
// acos
// =============================================================================

function demo_acos()

    exec("SCI/modules/graphics/demos/cmplxfunc/MacCmplx.sci", -1);
    theta = -110;
    alpha = 75;

    PlotCmplxFunc(2,%eps,"Square","Ox",41,"acos",theta,alpha,[-1,1]);
    demo_viewCode("demo_acos.dem.sce");

endfunction

demo_acos()

clear demo_acos;
