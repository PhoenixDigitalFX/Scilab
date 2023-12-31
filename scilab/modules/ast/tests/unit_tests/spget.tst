// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Cedric Delamarre
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

// <-- CLI SHELL MODE -->

//get from old module sparse (Scilab 5.4)

//-------------------------------------------------------------
//test de la primitives spget
//--------------------------------------------------------------
sp=sparse([1 6;1 5;1 3;2 4;2 1;4 4;4 3;5 1;6 6],1:9,[6 6]);
[ij,v]=spget(sp);
assert_checkequal(ij, [1,3;1,5;1,6;2,1;2,4;4,3;4,4;5,1;6,6]);
assert_checkequal(v, [3;2;1;5;4;7;6;8;9]);
zer=sparse([],[],[6,6]);[ij,v]=spget(zer);
assert_checkequal(ij, []);
assert_checkequal(v, []);

sp=sparse([1 6;1 5;1 3;2 4;2 1;4 4;4 3;5 1;6 6],[%t %t %t %t %t %t %t %t %t],[6 6]);
[ij,v,s]=spget(sp);
assert_checkequal(ij, [1,3;1,5;1,6;2,1;2,4;4,3;4,4;5,1;6,6]);
assert_checktrue(v);
assert_checkequal(s, [6,6]);
