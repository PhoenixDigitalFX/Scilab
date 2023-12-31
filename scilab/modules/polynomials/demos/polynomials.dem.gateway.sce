// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Michael Baudin
// Copyright (C) 2010-2011 - DIGITEO - Allan CORNET
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

function subdemolist = demo_gateway()

    demopath = get_absolute_file_path("polynomials.dem.gateway.sce");
    gettext("Polynomials");   // Lets gettext() harvesting it
    add_demo("Polynomials",demopath+"polynomials.dem.gateway.sce");

    subdemolist = [_("Introduction")             , "intro/poly.intro.dem.sce" ];

    subdemolist(:,2) = demopath + subdemolist(:,2);

endfunction

subdemolist = demo_gateway();
clear demo_gateway;