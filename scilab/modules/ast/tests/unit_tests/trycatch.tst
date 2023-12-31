// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2017 - ESI - Antoine ELIAS
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
//

// <-- CLI SHELL MODE -->

function foo()
    try
        error("random err")
    catch
        disp("should display")
        return
    end
    disp("should not display")
endfunction

foo()

function bar()
    try
        disp("should display")
        return
    catch
    end
    disp("should not display")
endfunction

bar()
