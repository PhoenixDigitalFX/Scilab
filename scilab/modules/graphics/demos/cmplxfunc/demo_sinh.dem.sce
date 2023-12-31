// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

// =============================================================================
// sinh
// =============================================================================

function demo_sinh()

    exec("SCI/modules/graphics/demos/cmplxfunc/MacCmplx.sci", -1);

    R     = %pi;
    e     = 0;
    theta = -148;
    alpha = 60;

    PlotCmplxFunc(R,0,"Disk","Ox",[40 20],"sinh",theta,alpha,[-R,R]);
    demo_viewCode("demo_sinh.dem.sce");

endfunction

demo_sinh()
clear demo_sinh;
