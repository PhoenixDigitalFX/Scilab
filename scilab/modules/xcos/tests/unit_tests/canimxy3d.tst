// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Clément DAVID
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
// <-- TEST WITH GRAPHIC -->

// test scope values 


assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/unit_tests/canimxy3d.zcos"));
xcos_simulate(scs_m, 4);

function assert_checkcanimxy3d()
    f=gcf();
    assert_checkequal(size(f.children), [1 1])

    a=f.children(1);
    assert_checkequal(size(a.children), [3 1])

    p1=a.children(1);

    assert_checkequal(f.figure_id, 20002);
    assert_checkequal(a.data_bounds, [-10 -10 -10 ; 10 10 10]);

    assert_checkequal(a.x_label.text, "x");
    assert_checkequal(a.y_label.text, "y");
    assert_checkequal(a.z_label.text, "z");

    // all polylines has the same configuration, we just need to check the first one.
    assert_checkequal(p1.polyline_style, 1);
    assert_checkequal(p1.line_mode, "off");

    assert_checkequal(p1.mark_mode, "on");
    assert_checkequal(p1.mark_style, 3);
    assert_checkequal(p1.mark_size, 5);
endfunction
assert_checkcanimxy3d()

// Simulate again to check multi-simulations cases
xcos_simulate(scs_m, 4);
assert_checkcanimxy3d()

