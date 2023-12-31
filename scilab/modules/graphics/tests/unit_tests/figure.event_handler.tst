//
//  Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
//  Copyright (C) 2008-2008 - INRIA - Bruno JOFRET
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.
//

// <-- TEST WITH GRAPHIC -->

// Create a default figure
my_figure = scf();

// check default values
assert_checkequal(my_figure.event_handler, "");
assert_checkequal(my_figure.event_handler_enable, "off");

// setEventhandler("mypersonnaleventhanlder") test
seteventhandler("mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler, "mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler_enable, "on");

// setEventhandler("") test
seteventhandler("");
assert_checkequal(my_figure.event_handler, "");
assert_checkequal(my_figure.event_handler_enable, "off");

// my_figure.event_handler = "mypersonnaleventhanlder"
my_figure.event_handler = "mypersonnaleventhanlder";
assert_checkequal(my_figure.event_handler, "mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler_enable, "off");

// my_figure.event_handler_enable = "on"
my_figure.event_handler_enable = "on";
assert_checkequal(my_figure.event_handler, "mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler_enable, "on");

// my_figure.event_handler = ""
// Erasing event_handler make enable flag go 'off'
 my_figure.event_handler = "";
assert_checkequal(my_figure.event_handler, "");
assert_checkequal(my_figure.event_handler_enable, "off");

// my_figure.event_handler_enable = "on";
// Forcing event handler enable without event handler raise a warning
assert_checkequal(my_figure.event_handler, "");
assert_checkequal(my_figure.event_handler_enable, "off");

// my_figure.event_handler = "mypersonnaleventhanlder"
// then enable
// then disable
my_figure.event_handler = "mypersonnaleventhanlder";
assert_checkequal(my_figure.event_handler, "mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler_enable, "off");
my_figure.event_handler_enable = "on";
assert_checkequal(my_figure.event_handler, "mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler_enable, "on");
my_figure.event_handler_enable = "off";
assert_checkequal(my_figure.event_handler, "mypersonnaleventhanlder");
assert_checkequal(my_figure.event_handler_enable, "off");

// Delete
delete(my_figure);
