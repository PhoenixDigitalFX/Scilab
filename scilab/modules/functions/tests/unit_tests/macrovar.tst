// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//<-- CLI SHELL MODE -->
//<-- NO CHECK REF -->

funcprot(0);

//1 in, 0 out
ref = list("i1", [], [], [], []);
function foo(i1)
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

//1 in, 1 out
ref = list("i1", "o1", [], [], []);
function o1 = foo(i1)
    o1 = i1;
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

//n in, n out
ref = list(["i1";"i2";"i3";"i4"], ["o1";"o2";"o3"], [], [], []);
function [o1, o2, o3] = foo(i1, i2, i3, i4)
    o1 = i1 + i2;
    o2 = i2 + i3;
    o3 = i3 + i4;
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

//add local vars
ref = list(["i1";"i2";"i3";"i4"], ["o1";"o2";"o3"], [], [], ["l1";"l2";"l3"]);
function [o1, o2, o3] = foo(i1, i2, i3, i4)
    l1 = i1 + i2;
    l2 = i2 + i3;
    l3 = i3 + i4;
    o1 = l1;
    o2 = l2;
    o3 = l3;
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

//add external vars
e1 = 1;
e2 = 2;
e3 = 3;

ref = list(["i1";"i2";"i3";"i4"], ["o1";"o2";"o3"], ["e1";"e2";"e3"], [], ["l1";"l2";"l3"]);
function [o1, o2, o3] = foo(i1, i2, i3, i4)
    l1 = i1 + i2;
    l2 = i2 + i3;
    l3 = i3 + i4;
    o1 = l1 + e1;
    o2 = l2 + e2;
    o3 = l3 + e3;
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

//add function calls
e1 = 1;
e2 = 2;
e3 = 3;

ref = list(["i1";"i2";"i3";"i4"], ["o1";"o2";"o3"], ["e1";"e2";"e3"], ["cos";"sin";"tan"], ["l1";"l2";"l3"]);
function [o1, o2, o3] = foo(i1, i2, i3, i4)
    l1 = i1 + i2;
    l2 = i2 + i3;
    l3 = i3 + i4;
    o1 = cos(l1 + e1);
    o2 = sin(l2 + e2);
    o3 = tan(l3 + e3);
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([], [], ["u";"t"], [], ["y"]);
function [] = foo()
    y = [u;t];
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([], [], ["u";"t"], [], ["y"]);
function [] = foo()
    y(1) = [u;t];
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([], [], ["u";"t"], [], ["y";"z"]);
function [] = foo()
    [y,z] = [u;t];
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([], [], ["u";"t"], [], ["y";"z"]);
function [] = foo()
    [y(1),z(2)] = [u;t];
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([], [], ["u";"t"], [], ["bar";"y"]);
function [] = foo()
    function bar()
    endfunction
    bar();
    y = [u;t];
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([], [], ["u";"t"], [], ["bar";"y"]);
function [] = foo()
    function bar()
    endfunction
    y = [u;t];
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list(["x1";"x2"], ["y"], ["a"], [], ["loc"]);
function y = foo(x1, x2)
    loc = 1;
    y = a*x1+x2-loc
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);

ref = list([],[],[],["length";"typeof";"steadycos";"lincos";"ppol";"obscont";"clear"],["M";"m";"l";"ph";"i";"scs_m";"X";"U";"Y";"XP";"sys";"Kc";"Kf";"Contr";"z0";"th0"]);

function foo()
    M=10;
    m=3;
    l=3;
    ph=0.1;
    for i=1:length(scs_m.objs)
        if typeof(scs_m.objs(i)) == "Block" then
            if scs_m.objs(i).gui == "SUPER_f" then
                scs_m=scs_m.objs(i).model.rpar;
                break
            end
        end
    end
    [X,U,Y,XP]=steadycos(scs_m,[],[],[],[],1,1:$);
    sys= lincos(scs_m,X,U);
    Kc=-ppol(sys.A,sys.B,[-1,-1,-1,-1]);
    Kf=-ppol(sys.A',sys.C',[-2,-2,-2,-2]);Kf=Kf';
    Contr=obscont(sys,Kc,Kf);
    clear("scs_m","X","Y","XP","Kc","Kp","sys","%cpr");
    z0=-4;
    th0=.02;
endfunction

val = macrovar(foo);
assert_checkequal(ref, val);
