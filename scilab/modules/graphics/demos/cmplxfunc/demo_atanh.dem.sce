// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

// =============================================================================
// atanh
// =============================================================================

function demo_atanh()

    exec("SCI/modules/graphics/demos/cmplxfunc/MacCmplx.sci", -1);
    R     = 2;
    e     = 0.001;
    theta = -110;
    alpha = 75;

    PlotCmplxFunc(R,e,"Square","Ox",41,"atanh",theta,alpha,[-0.99,0.99]);
    demo_viewCode("demo_atanh.dem.sce");

endfunction

demo_atanh()
clear demo_atanh;
