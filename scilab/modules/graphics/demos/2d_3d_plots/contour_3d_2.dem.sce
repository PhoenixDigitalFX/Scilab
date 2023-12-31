// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

function demo_contour_3d_2()
    my_handle             = scf(100001);
    clf(my_handle,"reset");
    demo_viewCode("contour_3d_2.dem.sce");

    // DEMO START

    my_plot_desc          = "plot3d and contour";
    my_handle.figure_name = my_plot_desc;

    t = %pi*(-10:10)/10;
    deff("[z]=Surf(x,y)","z=sin(x)*cos(y)");
    rect = [-%pi,%pi,-%pi,%pi,-5,1];
    z    = feval(t,t,Surf);
    contour(t,t,z,10,35,45,"X@Y@Z",[1,1,0],rect,-5);
    plot3d(t,t,z,35,45,"X@Y@Z",[2,1,3],rect);

    xtitle(my_plot_desc," "," "," ");

    // DEMO END
endfunction

demo_contour_3d_2();
clear demo_contour_3d_2;
