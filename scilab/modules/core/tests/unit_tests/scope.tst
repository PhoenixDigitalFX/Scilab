//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - SE - Sylvestre Ledru
// Copyright (C) 2012 - Inria - Fabrice Le Fessant
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================


function z = level1(x,y)
    a = y
    function z = level2()
       function x = a()
          x = 1
       endfunction
       z = a()
    endfunction
    z = x + level2()
endfunction

a = level1(1,2);
assert_checkequal(a, 2);
