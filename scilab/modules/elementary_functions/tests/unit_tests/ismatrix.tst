// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// unit tests for ismatrix function
// =============================================================================

// Constants
assert_checkequal(ismatrix([1 2 3]), %t);
assert_checkequal(ismatrix([1 2 3]'), %t);
assert_checkequal(ismatrix([1 2 3; 1 2 3]), %t);
assert_checkequal(ismatrix(1), %t);
assert_checkequal(ismatrix(rand(2,3,2)), %f);
assert_checkequal(ismatrix(rand(2,1,3)), %t);
assert_checkequal(ismatrix([]), %f);

// Strings
assert_checkequal(ismatrix(["s" "t" "u"]), %t);
assert_checkequal(ismatrix(["s" "t" "u"]'), %t);
assert_checkequal(ismatrix(["s" "t" "u";"s" "t" "u"]), %t);
assert_checkequal(ismatrix("s"), %t);
assert_checkequal(ismatrix(matrix(["s";"s";"s";"s";"s";"s";"s";"s"], [2,2,2])), %f);

// Polynomials
s=poly(0,"s");
assert_checkequal(ismatrix([1+s 2+s]), %t);
assert_checkequal(ismatrix([1+s 2+s]'), %t);
assert_checkequal(ismatrix([1+s 2+s 3+s; 3+s 4+s 5+s]), %t);
assert_checkequal(ismatrix(1+s), %t);
assert_checkequal(ismatrix(matrix([s;s;s;s;s;s;s;s;], [2,2,2])), %f);

// Booleans
assert_checkequal(ismatrix([%t %f]), %t);
assert_checkequal(ismatrix([%t %f]'), %t);
assert_checkequal(ismatrix([%t %f %t; %f %t %f]), %t);
assert_checkequal(ismatrix(%t), %t);
assert_checkequal(ismatrix(matrix([%t;%t;%t;%t;%t;%t;%t;%t], [2,2,2])), %f);

// Sparses
assert_checkequal(ismatrix(sparse([1 0 2])), %t);
assert_checkequal(ismatrix(sparse([1 0 2])'), %t);
assert_checkequal(ismatrix(sparse([1 0 3; 2 0 1])), %t);
assert_checkequal(ismatrix(sparse(0)), %t);

// Structures
clear s;
assert_checkequal(ismatrix(struct()), %f); // Empty structure
s.a = "test";
assert_checkequal(ismatrix(s), %t); // Scalar structure
clear s;
s(3,1).a = %pi;
assert_checkequal(ismatrix(s), %t); // Column structure
clear s;
s(3,1,1).a = %pi;
assert_checkequal(ismatrix(s), %t); // Column structure
clear s;
s(1,3).a = %e;
assert_checkequal(ismatrix(s), %t); // Row structure
clear s;
s(1,1,3).a = %e;
assert_checkequal(ismatrix(s), %t); // Row structure
clear s;
s(3,2).a = %z;
assert_checkequal(ismatrix(s), %t); // 2D structure array (not square)
clear s;
s(2,2,2).a = %s;
assert_checkequal(ismatrix(s), %f); // 3D structure array (cube)
clear s;
s(2,1,2).a = %s;
assert_checkequal(ismatrix(s), %t); // 3D structure array with singleton

// Cells
assert_checkequal(ismatrix(cell()), %f); // Empty cell
a = cell(1);
a{1} = 1;
assert_checkequal(ismatrix(a), %t); // Scalar case
clear a;
a = cell(1,3);
a{1} = 1:3;
a{2} = 1:3;
a{3} = 1:3;
assert_checkequal(ismatrix(a), %t); // Row case
clear a;
a = cell(3,1);
a{1} = 1:3;
a{2} = 1:3;
a{3} = 1:3;
assert_checkequal(ismatrix(a), %t); // Column case
clear a;
a = cell(3,2);
a{1,1} = 1:3;
a{1,2} = 1:3;
a{2,1} = 1:3;
a{2,2} = 1:3;
a{3,2} = 1:3;
a{3,1} = 1:3;
assert_checkequal(ismatrix(a), %t); // Matrix case
clear a;
a = cell(2,2,2);
a{1,1,1} =1:3;
a{1,2,1} =1:3;
a{2,1,1} =1:3;
a{2,2,1} =1:3;
a{1,1,2} =1:3;
a{1,2,2} =1:3;
a{2,1,2} =1:3;
a{2,2,2} =1:3;
assert_checkequal(ismatrix(a), %f); // Cubic case
a = cell(2,1,2);
a{1,1,1}=1:3;
a{2,1,1}=1:3;
a{1,1,2}=1:3;
a{2,1,2}=1:3;
assert_checkequal(ismatrix(a), %t); // Hypermatrix with singleton (square)

// Lists
assert_checkequal(ismatrix(list()), %f); // Empty list
l=list(1);
assert_checkequal(ismatrix(l), %t); // Scalar case
clear l;
l=list(1,"test");
assert_checkequal(ismatrix(l), %t); // Column case

// Error messages
errmsg1 = msprintf(_("%s: Wrong number of input argument(s): %d expected.\n"),"ismatrix", 1);
assert_checkerror("ismatrix()", errmsg1);
errmsg2 = msprintf(_("Wrong number of input arguments.\n"));
assert_checkerror("ismatrix(1,2)", errmsg2);
errmsg3 = msprintf(_("Wrong number of output arguments.\n"));
assert_checkerror("[r,b]=ismatrix([1 2 3]);", errmsg3);
