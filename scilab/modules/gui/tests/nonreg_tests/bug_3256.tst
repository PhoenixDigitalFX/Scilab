// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
// <-- INTERACTIVE TEST -->
//
// <-- Non-regression test for bug 3256 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3256
//
// <-- Short Description -->
// The cursor of slider uicontrol is not displayed if the slider step is not an integer value.

// Figure creation
// =====================================================================

my_figure = figure( ...
"Position"        , [30 50 600 400], ...
"BackgroundColor" , [1 1 1]);


// Test 1
// =====================================================================

my_ini_value_1 = 5;

function update_text_1()
    set(findobj("tag", "my_text_1"),"string",string(get(gcbo,"Value")));
endfunction

my_slider_1 = uicontrol( ...
"parent"              , my_figure                 , ...
"style"               , "slider"                  , ...
"Min"                 , 0                         , ...
"Max"                 , 20                        , ...
"Value"               , my_ini_value_1            , ...
"SliderStep"          , [1 2]                     , ...
"position"            , [ 10 200 400 20 ]         , ...
"callback"            , "update_text_1()"         );

my_text_1 = uicontrol( ...
"parent"             , my_figure                  , ...
"position"           , [500 200 60 20]            , ...
"Style"              , "text"                     , ...
"String"             , string(my_ini_value_1)     , ...
"tag"                , "my_text_1"               );



// Test 2
// =====================================================================

my_ini_value_2 = 1;

function update_text_2()
    set(findobj("tag", "my_text_2"),"string",string(get(gcbo,"Value")));
endfunction

my_slider_2 = uicontrol( ...
"parent"              , my_figure                  , ...
"style"               , "slider"                   , ...
"Min"                 , 0                          , ...
"Max"                 , 2                          , ...
"Value"               , my_ini_value_2             , ...
"SliderStep"          , [0.1 0.2]                  , ...
"position"            , [ 10 100 400 20 ]          , ...
"callback"            , "update_text_2()"          );

my_text_2 = uicontrol( ...
"parent"              , my_figure                  , ...
"position"            , [500 100 60 20]            , ...
"Style"               , "text"                     , ...
"String"              , string(my_ini_value_2)     , ...
"tag"                 , "my_text_2"               );

// Move the second slider and check that it is already displayed

