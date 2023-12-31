// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
//
// <-- Non-regression test for bug 1469 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1469
//
// <-- Short Description -->
//    Appended comments are considered as a new physical line
//

//test of line numbering in  functions, handling initial comments


// ================ Test 1 =====================================================

function foo,endfunction
L=macr2tree(foo);
R1=L(6)==1&size(L)==6;
if ~R1 then pause,end
clear foo;

// ================ Test 2 =====================================================
// known syntax error in scilab 6
//function foo,,endfunction
//L=macr2tree(foo);
//R2=L(6)==1&size(L)==6
//if ~R2 then pause,end
//clear foo;

// ================ Test 3 =====================================================

function foo(),endfunction
L=macr2tree(foo);
R3=L(6)==1&size(L)==6;
if ~R3 then pause,end
clear foo;

// ================ Test 4 =====================================================

function foo(),a=1,endfunction
L=macr2tree(foo);
R4=L(6)==1&size(L)==6;
if ~R4 then pause,end
clear foo;

// ================ Test 5 =====================================================

function foo
endfunction
L=macr2tree(foo);
R5=L(6)==2&size(L)==6;
if ~R5 then pause,end
clear foo;

// ================ Test 6 =====================================================

function foo,
endfunction
L=macr2tree(foo);
R6=L(6)==2&size(L)==6;
if ~R6 then pause,end
clear foo;

// ================ Test 7 =====================================================

function foo//ZZZZ
endfunction
L=macr2tree(foo);
R7=L(6)==2&size(L)==6;
if ~R7 then pause,end
clear foo;

// ================ Test 8 =====================================================

function foo,//ZZZZ
endfunction
L=macr2tree(foo);
R8=L(6)==2&size(L)==6;
if ~R8 then pause,end
clear foo;

// ================ Test 9 =====================================================

function foo
    //ZZZZ
endfunction
L=macr2tree(foo);
R9=L(6)==3&size(L)==6;
if ~R9 then pause,end
clear foo;

// ================ Test 10 ====================================================

function foo,//ZZZZ
    a=1
endfunction
L=macr2tree(foo);
R10=L(6)==3&size(L)==6;
if ~R10 then pause,end
clear foo;

// ================ Test 11 ====================================================

function loc=foo,[l,w]=where(),loc=l(1),endfunction
R11= and(foo()==1);
if ~R11 then pause,end
clear foo;

// ================ Test 12 ====================================================

function loc=foo,//ZZZZ
    [l,w]=where(),loc=l(1)
endfunction
R12= and(foo()==2);
if ~R12 then pause,end
clear foo;

// ================ Test 13 ====================================================

function loc=foo
    //ZZZZ
    [l,w]=where(),loc=l(1)
endfunction
R13= and(foo()==3);
if ~R13 then pause,end
clear foo;

// ================ Test 14 ====================================================

function loc=foo1()
    [l,w]=where(),loc=l(1)
    function loc=foo3(loc)
        [l,w]=where(),loc=[loc,l(1:2)']
    endfunction
    [l,w]=where(),loc=[loc,l(1)]
    loc=foo3(loc)
endfunction
R14= and(foo1()==[2,6,2,7]);
if ~R14 then pause,end
clear foo1;

// ================ Test 15 ====================================================

function loc=foo1()//ZZZZZZZ
    [l,w]=where(),loc=l(1)
    function loc=foo3(loc)
        [l,w]=where(),loc=[loc,l(1:2)']
    endfunction
    [l,w]=where(),loc=[loc,l(1)]
    loc=foo3(loc)
endfunction
L=macr2tree(foo1);
R15=and(foo1()==[2,6,2,7])&(L(6)==8);
if ~R15 then pause,end
clear foo1;

// ================ Test 16 ====================================================

function loc=foo1()
    //ZZZZZZZ
    [l,w]=where(),loc=l(1)
    function loc=foo3(loc)
        [l,w]=where(),loc=[loc,l(1:2)']
    endfunction
    [l,w]=where(),loc=[loc,l(1)]
    loc=foo3(loc)
endfunction
L=macr2tree(foo1);
R16=and(foo1()==[3,7,2,8])&(L(6)==9);
if ~R16 then pause,end
clear foo1;

// ================ Test 17 ====================================================

//pb execution des macros non compilee
deff("y=foo(a,b,c)","y=a+b+c");
R17=foo("aaa","bbb","cc")=="aaabbbcc";
if ~R17 then pause,end
clear foo

// ================ Test 18 ====================================================

deff("y=foo(a,b,c)",["","y=a+b+c"]);
R18=foo("aaa","bbb","cc")=="aaabbbcc";
if ~R18 then pause,end
clear foo

// ================ Test 20 ====================================================

//function definition nested in a or loop!
z=0;R20=%t;
for k=1:2
    function y=foo()
        y=k
    endfunction
    L=macr2tree(foo);
    R20=R20&(L(6)==3);
    z=z+foo();
end
R20=R20&z==3;
if ~R20 then pause,end

// ================ Test 21 ====================================================

//test avec getf
t=["function foo,//ZZZZ"
"  a=1"
"endfunction"];
mputl(t,TMPDIR+"/foo.sci");
warning("off");
exec(TMPDIR+"/foo.sci")
warning("on");
L=macr2tree(foo); //getf ignores declaration line comments
R21=L(6)==3&size(L)==6;
if ~R21 then pause,end
clear foo;

// ================ Test 22 ====================================================

t=["function foo"
"//ZZZZ"
"  a=1"
"endfunction"];
mputl(t,TMPDIR+"/foo.sci");
exec(TMPDIR+"/foo.sci")
L=macr2tree(foo); //getf ignores declaration line comments
R22=L(6)==4&size(L)==6;
if ~R22 then pause,end
clear foo;

// ================ Test 23 ====================================================
function foo()
    function bar()
        a=1
    endfunction
endfunction

t=macr2tree(foo);
t=tree2code(t);
if size(t,1)<>5 then pause,end

clear foo
function foo()
    function bar()
        a=1
    endfunction
endfunction

t1=macr2tree(foo);
t1=tree2code(t1);
if or(t<>t1) then pause,end
// ================ Test 24 ====================================================
function test;endfunction
L=macr2tree(test);
if size(L)<>6 then pause,end
if L(6)<>1 then pause,end
