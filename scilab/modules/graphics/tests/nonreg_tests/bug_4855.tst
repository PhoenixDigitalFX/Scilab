// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - pierre.lando@scilab.org
//
//// This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
//
// <-- Non-regression test for bug 4855 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4855
//
// <-- Short Description -->
//   Use the standard error messages when setting graphics properties with bad values.

// Check error messages from this settings :
// alignment
// anti_aliasing
// arc_drawing_method
// arrow_size_factor
// arrow_size
// auto_clear
// auto_dimensionning
// auto_position
// auto_resize
// auto_rotation
// auto_scale
// auto_ticks
// axes_bounds
// axes_reverse
// axes_size
// axes_visible
// background
// bar_layout
// bar_width
// box
// callbackmevent
// callback
// callback_type
// cdata_mapping
// clip_box
// clip_state
// closed
// colored
// color_flag
// color_map
// color_mode
// color_range
// cube_scaling
// current_axes
// current_entity
// current_figure
// data_bounds


// Test 'on/off' property over a "Figure"
function test(varargin); endfunction;

function [svalue, value]=TestedParameter(i);
    if i == 0 then svalue = "on"; value = "on"; end;
    if i == 1 then svalue = "off"; value = %f; end;
    if i == 2 then svalue = "on"; value = 1; end;
    if i == 3 then svalue = "off"; value = 0; end;
    if i == 4 then svalue = "on"; value = %t; end;
    if i == 5 then svalue = "off"; value = "0"; end;
    if i == 6 then svalue = "on"; value = "1"; end;
    if i == 5 then svalue = "off"; value = "F"; end;
    if i == 6 then svalue = "on"; value = "T"; end;
    if i == 9 then svalue = "off"; value = "off"; end;
endfunction;


f=gcf();
f.event_handler="test";
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    f.auto_resize = value;
    f.immediate_drawing = value;
    f.visible = value;
    f.event_handler_enable = value;

    if f.auto_resize <> svalue then pause; end;
    if f.immediate_drawing <> svalue then pause; end;
    if f.visible <> svalue then pause; end;
    if f.event_handler_enable <> svalue then pause; end;
end;

// Test 'on/off' property over an "Axes"
a=gca();
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    a.visible = value;
    a.filled = value;
    a.fractional_font = value;
    a.isoview = value;
    a.cube_scaling = value;
    a.tight_limits = value;
    a.auto_clear = value;
    a.auto_scale = value;
    a.line_mode = value;
    a.mark_mode = value;

    if a.visible <> svalue then pause; end;
    if a.filled <> svalue then pause; end;
    if a.fractional_font <> svalue then pause; end;
    if a.isoview <> svalue then pause; end;
    if a.cube_scaling <> svalue then pause; end;
    if a.tight_limits <> svalue then pause; end;
    if a.auto_clear <> svalue then pause; end;
    if a.auto_scale <> svalue then pause; end;
    if a.line_mode <> svalue then pause; end;
    if a.mark_mode <> svalue then pause; end;
end;

// Test 'on/off' property over an 'Plot3d'
plot3d();
e=gce();
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    e.surface_mode = value;
    e.mark_mode = value;

    if e.surface_mode <> svalue then pause; end;
    if e.mark_mode <> svalue then pause; end;
end;

// Test 'on/off' property over an 'Polyline'
plot2d(1:4,cos(1:4));
e=gce(); e=e.children(1);
e.interp_color_vector=[1:4];
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    e.visible = value;
    e.closed = value;
    e.line_mode = value;
    e.fill_mode = value;
    e.interp_color_mode = value;
    e.mark_mode = value;

    if e.visible <> svalue then pause; end;
    if e.closed <> svalue then pause; end;
    if e.line_mode <> svalue then pause; end;
    if e.fill_mode <> svalue then pause; end;
    if e.interp_color_mode <> svalue then pause; end;
    if e.mark_mode <> svalue then pause; end;
end;


// Test 'on/off' property over an 'Text'
xstring(0,0,"test");
e=gce();
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    e.visible = value;
    e.line_mode = value;
    e.fill_mode = value;
    e.fractional_font = value;
    e.auto_dimensionning = value;

    if e.visible <> svalue then pause; end;
    if e.line_mode <> svalue then pause; end;
    if e.fill_mode <> svalue then pause; end;
    if e.fractional_font <> svalue then pause; end;
    if e.auto_dimensionning <> svalue then pause; end;
end;

// Test 'on/off' property over an 'Label'
a=gca();
e=a.title;
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    e.visible = value;
    e.fill_mode = value;
    e.fractional_font = value;
    e.auto_position = value;
    e.auto_rotation = value;

    if e.visible <> svalue then pause; end;
    if e.fill_mode <> svalue then pause; end;
    if e.fractional_font <> svalue then pause; end;
    if e.auto_position <> svalue then pause; end;
    if e.auto_rotation <> svalue then pause; end;
end;

// Test 'on/off' property over an 'Champ'
champ(-5:5,-5:5,rand(11,11),rand(11,11));
e=gce();
for i = [0:9] do
    [svalue, value]=TestedParameter(i);
    e.visible = value;
    e.colored = value;

    if e.visible <> svalue then pause; end;
    if e.colored <> svalue then pause; end;
end;
