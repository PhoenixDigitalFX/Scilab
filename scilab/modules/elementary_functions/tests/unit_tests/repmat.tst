// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - INRIA - Serge Steer
// Copyright (C) 2018 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

assert_checkequal(repmat(1:3,2,2),[1,2,3,1,2,3;1,2,3,1,2,3]);
assert_checkequal(repmat(1+2*%i,2),[ 1+%i*2, 1+%i*2; 1+%i*2, 1+%i*2]);
a=int8([1 0 1;0 1 0]);
assert_checkequal(repmat(a,2,3,2),matrix(int8([1;0;1;0;0;1;0;1;1;0;1;0;1;0;1;0;0;1; ...
0;1;1;0;1;0;1;0;1;0;0;1;0;1;1;0;1;0;1;0;1;0;0;1;0;1; ...
1;0;1;0;1;0;1;0;0;1;0;1;1;0;1;0;1;0;1;0;0;1;0;1;1;0; ...
1;0]),4,9,2));
assert_checkequal(repmat("Scilab",3,2),["Scilab","Scilab";"Scilab","Scilab";"Scilab","Scilab"]);
H=repmat([1/%s;2/(%s+1)],1,3);
s=poly(0,"s");
H_ref=[1/s,1/s,1/s;2/(1+s),2/(1+s),2/(1+s)];
assert_checkequal(H.num, H_ref.num);
assert_checkequal(H.den, H_ref.den);
assert_checkequal(repmat([],2,2),[]);
B_ref=int8(matrix([1;3;7;15;31;63;127;55;1;3;7;15;31;63;127;55], [2 4 2]));
assert_checkequal(repmat(int8([1,7,31,127;3,15,63,55]),1,1,2),B_ref);
C_ref = matrix(1:24, [2 3 2 2]);
assert_checkequal(repmat(C_ref,1),C_ref);
assert_checkequal(repmat(1:2, 2),[1 2 1 2; 1 2 1 2]);
assert_checkequal(repmat(matrix(1:2, [1 2]),2),[1 2 1 2; 1 2 1 2]);
assert_checkequal(repmat([1,2;3,4],[2,3]),[1,2,1,2,1,2;3,4,3,4,3,4;1,2,1,2,1,2;3,4,3,4,3,4]);
assert_checkequal(repmat(int8([1,2;3,4]),[2,3]),int8([1,2,1,2,1,2;3,4,3,4,3,4;1,2,1,2,1,2;3,4,3,4,3,4]));
assert_checkequal(repmat(matrix(1:2, 1, 2),[2,3]),[1,2,1,2,1,2;1,2,1,2,1,2]);

// With sparse matrices
assert_checkequal(repmat(sparse([]), 2, 3), sparse([]));
assert_checkequal(repmat(sparse(1), 1, 1), sparse(1));
assert_checkequal(repmat(sparse(1), 1, 3), sparse([1 1 1]));
assert_checkequal(repmat(sparse(1), 3, 1), sparse([1 1 1]'));
assert_checkequal(repmat(sparse([1 0]), 1, 3), sparse([1 0 1 0 1 0]));
assert_checkequal(repmat(sparse([1 0]), 3, 1), sparse([1 0 ; 1 0 ; 1 0]));
assert_checkequal(repmat(sparse([1 0 -1]), 3, 2), sparse([1 0 -1 1 0 -1 ; 1 0 -1 1 0 -1 ; 1 0 -1 1 0 -1]));

// With other hypermatrices
    // Polynomials
H = repmat([%z %z^2], [1 2 2]);
res = cat(3, [%z %z^2 %z %z^2], [%z %z^2 %z %z^2]);
assert_checkequal(H,res);
H = repmat(cat(3,[%z %z^2],[1 %z]), 1, 2);
res = cat(3, [%z %z^2 %z %z^2], [1 %z 1 %z]);
assert_checkequal(H,res);
    // Rationals
H = repmat(1./[%z %z^2], [1 2 2]);
res = cat(3, 1./[%z %z^2 %z %z^2], 1./[%z %z^2 %z %z^2]);
assert_checkequal(H,res);
H = repmat(1./cat(3,[%z %z^2],[1 %z]), 1, 2);
res = cat(3, 1./[%z %z^2 %z %z^2], 1./[1 %z 1 %z]);
assert_checkequal(H,res);
    // Booleans
H = repmat([%t %f ; %f %t], [1 2 2]);
res = cat(3, [%t %f %t %f; %f %t %f %t], [%t %f %t %f; %f %t %f %t]);
assert_checkequal(H,res);
H = repmat(cat(3,[%f %t %t],[%t %f %t]), 2, 1);
res = cat(3, [%f %t %t ; %f %t %t], [%t %f %t; %t %f %t]);
assert_checkequal(H,res);
    // Texts
H = repmat(["a" "b" ; "c" "d"], [2 1 2]);
res = cat(3, ["a" "b" ; "c" "d" ; "a" "b" ; "c" "d"], ..
             ["a" "b" ; "c" "d" ; "a" "b" ; "c" "d"]);
assert_checkequal(H, res);
H = repmat(cat(3,"a", "b", "c"), 2,3,2);
res = cat(3,["a" "a" "a"; "a" "a" "a"],["b" "b" "b"; "b" "b" "b"],["c" "c" "c"; "c" "c" "c"]);
res = cat(3, res, res);
assert_checkequal(H, res);

