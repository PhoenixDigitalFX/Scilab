// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre.marechal@scilab.org>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

exec(SCI+"/modules/gui/tests/unit_tests/uicontrol.slider.size.tst.sci");

// Parameters
// =========================================================================

global axes_w;
global axes_h;

global padding_x;
global padding_y;

axes_w      = 900;    // Axes width
axes_h      = 1000;     // Axes height

padding_x   = 10;      // Horizontal padding between each elements
padding_y   = 10;      // Vertical padding between each elements

// Figure creation
// =========================================================================

my_figure_handle                 = scf(100001);
my_figure_handle.background      = -2;
my_figure_handle.figure_position = [0 0];
my_figure_handle.axes_size       = [axes_w axes_h];
my_figure_handle.figure_name     = gettext("Test Slider [Sizes]");

// Title
// =========================================================================

title_1 = uicontrol(my_figure_handle                                              , ...
	"position"            , [padding_x axes_h-padding_y-20 axes_w-2*padding_x 30] , ...
	"Style"               , "text"                                                , ...
	"String"              , "Test Slider"                                         , ...
	"BackgroundColor"     , [1 1 1]                                               , ...
	"Fontsize"            , 16                                                    , ...
	"horizontalalignment" , "center"                                              , ...
	"tag"                 , "pos_title_1"                                         );

// Slider parameters
// =========================================================================

global num_slider;

global slider_min;
global slider_max;
global slider_step;
global slider_ini_value;

slider_min       = -10;
slider_max       = 10;
slider_step      = [2 4];
slider_ini_value = 5;

num_slider       = 0;

// Create Slider
// =========================================================================

create_slider(  50  , 20 );
create_slider(  100 , 20 );
create_slider(  200 , 20 );
create_slider(  300 , 20 );
create_slider(  400 , 20 );
create_slider(  500 , 20 );

create_slider(  500 , 5 );
create_slider(  500 , 10 );
create_slider(  500 , 20 );
create_slider(  500 , 30 );
create_slider(  500 , 40 );
create_slider(  500 , 50 );
