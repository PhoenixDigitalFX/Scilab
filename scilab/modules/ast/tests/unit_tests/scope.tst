// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Antoine ELIAS
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

a=[1 2 3];

function new_var()
    a([]) = [];
    assert_checkequal(a, []);
endfunction

function use_previous()
    a;
    a(2) = 4;
    assert_checkequal(a, [1 4 3]);
endfunction

new_var;
assert_checkequal(a, [1 2 3]);
use_previous;
assert_checkequal(a, [1 2 3]);
