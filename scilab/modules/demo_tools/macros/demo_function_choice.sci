
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Ghislain HELIOT
//
// Copyright (C) 2012 - 2016 - Scilab Enterprises
//
// This file is hereby licensed under the terms of the GNU GPL v2.0,
// pursuant to article 5.3.4 of the CeCILL v.2.1.
// This file was originally licensed under the terms of the CeCILL v2.1,
// and continues to be available under such terms.
// For more information, see the COPYING file which you should have received
// along with this program.

function []=demo_function_choice()
    while %t then
        num=x_choose(demolist(:,1),"Choose a demo");
        if num==0 then
            close(0);
            lines(oldln(1));
            return;
        else
            close(0);
            clf();
            execstr(demolist(num,2));
        end,
    end
    mode(0);
endfunction
