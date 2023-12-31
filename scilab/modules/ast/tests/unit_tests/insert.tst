// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Antoine ELIAS
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

// <-- NO CHECK REF -->
// <-- CLI SHELL MODE -->

oldFuncProt = funcprot(0);
ref = [0 0 0 ; 0 1 4 ; 0 2 5];
a = zeros(3,3);a(:) = 1:9;
b(2:3, 2:3) = a(1:2,1:2);

assert_checkequal(b, ref);

a=2;
a.b=3;
assert_checkequal(a.b, 3);
a.b.c=4;
assert_checkequal(a.b.c, 4);
clear a

a.b = 2;
a.c = 3;
a.d = 4;

e.f = 7;
e.d = 55;
e.g = 12;

a(2) = e;
assert_checkequal(fieldnames(a(1)), fieldnames(a(2)));
assert_checkequal(a(1).d, 4);
assert_checkequal(a(2).d, 55);

clear a;
clear e;

a.a.a = -2;
assert_checkequal(a.a.a, -2);

a(2, 1:3, [2 6 7]).b = 12;
computed = a.b;
expected = list();
for i=1:(2*3*7)
    expected(i) = [];
end
expected(8)  = 12;
expected(10) = 12;
expected(12) = 12;
expected(32) = 12;
expected(34) = 12;
expected(36) = 12;
expected(38) = 12;
expected(40) = 12;
expected(42) = 12;
assert_checkequal(a.b, expected);
clear a;

a(1,3).b = 2;
assert_checkequal(size(a), [1 3]);
a(5).b = 2;
assert_checkequal(size(a), [1 5]);
a(2,3).b = 2;
assert_checkequal(size(a), [2 5]);
clear a;

st.f.e = 22;
st.f(3).e = 112;
assert_checkequal(st.f.e, list(22, [], 112));

st.f(2).j = 1124;
assert_checkequal(st.f.j, list([], 1124, []));

st.f.e = 5;
assert_checkequal(st.f.e, list(5, 5, 5));
clear st;

//tlist
tl=tlist(["myTlist" "gg"], 22);
tll=tlist(["myTlOfTl" "tt"],tl);

a.b=tll;
a.b.tt(2) = 4;
assert_checkequal(a.b.tt(2), 4);
assert_checkequal(a.b.tt.gg, 4);
a.b.tt.gg = 5;
assert_checkequal(a.b.tt(2), 5);
assert_checkequal(a.b.tt.gg, 5);
clear a;

rl = rlist(%s,2);
a.b = [rl rl rl];
a.b(2) = [4 4 4];
assert_checkequal(a.b.num, [4 4 4]);
assert_checkequal(a.b.den, [2 2 2]);
clear a;

a.b = [rl rl rl];
%r_6 = %r_e;

a.b(1,2).num = 14;
assert_checkequal(a.b.num, [%s 14 %s]);
assert_checkequal(a.b.den, [2 2 2]);

a(2).b = [rl rl rl] * %s;
assert_checkequal(size(a), [2 1]);
assert_checkequal(a(2).b.num, [%s**2 %s**2 %s**2]);

err = execstr("a.b(1,3).num = 5;", "errcatch");
assert_checktrue(err <> 0);


a(3).b.num = 12;
assert_checkequal(a(3).b.num, 12);

execstr("a.b(1,1).num = -9;", "errcatch");
assert_checktrue(err <> 0);
clear a;

tt = tlist(["toto" "gg" "ff"] , 12, 13);
tt(3).c = 23;
assert_checkequal(tt.ff.c, 23);
tt(2).c = 22;
assert_checkequal(tt.gg.c, 22);

err = execstr("tt([2 3]).d = 99;", "errcatch");
assert_checktrue(err <> 0);

err = execstr("tt([2 3]).d.e = 98;", "errcatch");
assert_checktrue(err <> 0);

err = execstr("tt([2 3]).d(3).e = 78;", "errcatch");
assert_checktrue(err <> 0);

tt(2).d.e(4) = 12;
assert_checkequal(tt(2).d.e, [0; 0; 0; 12]);

tt(2).d(2).o = 15;
err = execstr("tt(2).d.e(4) = 16;", "errcatch");
assert_checktrue(err <> 0);

clear tt;

tl=tlist(["toto" "gg"],11);
function tutu(tl)
    tl.gg = 12;
    assert_checkequal(tl.gg, 12);
endfunction

tutu(tl);
assert_checkequal(tl.gg, 11);
clear tl;

// mlist
function varargout=%toto_e(varargin)
    args = varargin(1);
    ml = varargin($);
    varargout = list();

    for i=args
        if i == 1
            varargout($+1) = ["toto" "gg" "ff"];
        elseif i == 2
            varargout($+1) = ml.gg;
        elseif i == 3
            varargout($+1) = ml.ff;
        end
    end
endfunction

%toto_6 = %toto_e;

function r=%l_i_toto(varargin)
    args = varargin(1);
    l = varargin($-1);
    r = varargin($);
    for i=1:size(args, "*")
        if args(i) == 2
            r.gg = l(i);
        elseif args(i) == 3
            r.ff = l(i);
        end
    end
endfunction

function r=%st_i_toto(varargin)
    args = varargin(1);
    st = varargin($-1);
    r = varargin($);
    for i=args
        if i == 2
            r.gg = st;
        elseif i == 3
            r.ff = st;
        end
    end
endfunction

mm = tlist(["toto" "gg" "ff"] , 12, 13);
mm(3).c = 23;
assert_checkequal(mm.ff.c, 23);
mm(2).c = 22;
assert_checkequal(mm.gg.c, 22);

err = execstr("mm([2 3]).d = 99;", "errcatch");
assert_checktrue(err <> 0);

err = execstr("mm([2 3]).d.e = 98;", "errcatch");
assert_checktrue(err <> 0);

err = execstr("mm([2 3]).d(3).e = 78;", "errcatch");
assert_checktrue(err <> 0);

mm(2).d.e(4) = 12;
assert_checkequal(mm(2).d.e, [0; 0; 0; 12]);

mm(2).d(2).o = 15;
err = execstr("mm(2).d.e(4) = 16;", "errcatch");
assert_checktrue(err <> 0);

clear mm;

ml = mlist(["tutu" "t"], 12);
std=struct("d", 5);
stc=struct("c", 6);
a=std;
assert_checkequal(a, std);
a=stc;
assert_checkequal(a, stc);
ml.t = std;
assert_checkequal(ml.t.d, 5);
ml.t = stc;
assert_checkequal(ml.t.c, 6);

ml = mlist(["tutu" "t"], 12);
ml.t = 21;
assert_checkequal(ml.t, 21);

function r=%s_i_tutu(varargin)
    s1=varargin($-1);
    s2=varargin($);
    r=s2;
    r.t = s1;
endfunction

function r=%tutu_e(varargin)
    r=varargin($).t;
endfunction

function r=%st_i_tutu(varargin)
    s1=varargin($-1);
    s2=varargin($);
    //s2(i,j)=s1 s1 is a struct
    r=s2;
    r.t = s1;
endfunction

%tutu_6 = %tutu_e;

a.b = ml;
assert_checkequal(a.b(2), 21);
a.b(2) = stc;
assert_checkequal(a.b(2), stc);
a.b(2).c=44;
assert_checkequal(a.b(2).c, 44);
clear a;

//tlist/mlist
tl =tlist(["toto" "gg"], tlist(["tutu" "tt" "ee"], 22, 23));
tl(2)(3)=12;
assert_checkequal(tl.gg.ee, 12);
tl(2)(3)(4)=88;
assert_checkequal(tl.gg.ee, [12; 0; 0; 88]);

function r=%tata_e(varargin)
    r=varargin($).ff;
endfunction

%tata_6 = %tata_e;

function r=%toto_i_tata(varargin)
    s1=varargin($-1);
    s2=varargin($);
    r=s2;
    r.ff = s1;
endfunction

ml = mlist(["tata" "ff"], tl);
assert_checkequal(ml.ff.gg.ee, [12; 0; 0; 88]);
ml(2)(2)(3) = 44;
assert_checkequal(ml.ff.gg.ee, 44);
clear tl;

// List
l=list();
// call insertion overload
err = execstr("l.x = 2;","errcatch");
assert_checkequal(err, 999);

st.l = list([1 2 3], "toto");
st.l = 44;
assert_checkequal(st.l, 44);

st.l = list([1 2 3], "toto");
st.l(3) = 55;
assert_checkequal(st.l(3), 55);

st.l(1)(2) = -2;
assert_checkequal(st.l(1), [1 -2 3]);

st.l(3) = tlist(["toto", "gg"], 112);

function r=%l_6(varargin)
    r=[]
    for in = varargin(2)
        if type(in) == 16 // tlist
            if find(varargin(1) == in(1)) <> [] // search field in tlist
                r = in(varargin(1));
            end
        end
    end
endfunction

function l=%st_i_l(varargin)
    l=list();
    pos = 0;
    for in = varargin(3)
        pos = pos + 1;
        if type(in) == 16 // tlist
            in((varargin(1))) = varargin(2);
        end
        l(pos) = in;
    end
endfunction

st.l.gg.c = 12;
assert_checkequal(st.l(1), [1 -2 3]);
assert_checkequal(st.l(2), "toto");
assert_checkequal(st.l(3).gg, struct("c", 12));
clear st;

st.l = list([1 2 3], "toto");
function r=%s_i_l(varargin)
    r=struct(varargin(1), varargin(2)) ;
endfunction

st.l.c = 24;
assert_checkequal(st.l, struct("c", 24));
clear st;

// check error overload
errmsg = msprintf(gettext("%s: Affection of a string in a matrix of numbers is not implemented.\n"), "%c_i_s");
assert_checkerror("a=1;a(1,1)=""d""", errmsg);

// list delete
tl = tlist(["toto" "gg" "ff" "uu"], 45, 89, 87);
tl(2) = null();

assert_checkequal(tl(1), ["toto" "gg" "ff" "uu"]);
assert_checkequal(tl(2), 89);
assert_checkequal(tl(3), 87);

tl = tlist(["toto" "gg" "ff" "uu"], 45, 89, 87);
// call overload
err = execstr("tl.gg = null();","errcatch");
assert_checkequal(err, 999);

function l=%0_i_toto(varargin)
    idx = find(varargin(3)(1) == varargin(1));
    l = varargin(3);
    l(idx) = null();
endfunction

tl.gg = null();
assert_checkequal(tl(1), ["toto" "gg" "ff" "uu"]);
assert_checkequal(tl(2), 89);
assert_checkequal(tl(3), 87);

clear tl;

l = list(["toto" "gg" "ff" "uu"], 45, 89, 87);
l(2) = null();

assert_checkequal(l(1), ["toto" "gg" "ff" "uu"]);
assert_checkequal(l(2), 89);
assert_checkequal(l(3), 87);

l = list(["toto" "gg" "ff" "uu"], 45, 89, 87);
// call overload
err = execstr("l.gg = null();","errcatch");
assert_checkequal(err, 999);

clear l;

// cell

function varargout=%toto_e(varargin)
    args = varargin(1);
    ml = varargin($);
    varargout = list();

    for i=args
        if i == 1
            varargout($+1) = ["toto" "ff"];
        elseif i == 2
            varargout($+1) = ml.ff;
        end
    end
endfunction

%toto_6 = %toto_e;

function ml=%s_i_toto(varargin)
    args = varargin(1);
    s = varargin($-1);
    ml = varargin($);
    for i=1:size(args, "*")
        if args(i) == 2
            ml.ff = s;
        end
    end
endfunction

tl = tlist(["tutu" "gg"], 12);
ml = mlist(["toto" "ff"], 22);

a{2} = 2;
assert_checkequal(a{2}, 2);
a{1,3} = tl;
assert_checkequal(a{5}(1), ["tutu" "gg"]);
assert_checkequal(a{5}(2), 12);
a{[3 6]} = ml;
assert_checkequal(a{3}(1), ["toto" "ff"]);
assert_checkequal(a{3}(2), 22);
assert_checkequal(a{6}(1), ["toto" "ff"]);
assert_checkequal(a{6}(2), 22);

a{2}.c = 123;
assert_checkequal(a{2}.c, 123);

a{2}(3).e = 12;
assert_checkequal(a{2}.e, list([], [], 12));
assert_checkequal(a{2}.c, list(123, [], []));

a{2}.b = 12;
assert_checkequal(a{2}.b, list(12, 12, 12));

a{2}.e = 99;
assert_checkequal(a{2}.e, list(99, 99, 99));

a{6}(2) = 8;
assert_checkequal(a{6}(1), ["toto" "ff"]);
assert_checkequal(a{6}(2), 8);

a{1, [1 3]}.gg = 14;
assert_checkequal(a{1}.gg, 14);
assert_checkequal(a{5}.gg, 14);

a{1:2, [1 3], 2}.g = "A string";
assert_checkequal(a{7}.g, "A string");
assert_checkequal(a{8}.g, "A string");
assert_checkequal(a{11}.g, "A string");
assert_checkequal(a{12}.g, "A string");
clear a;

a{1,3}.b = 2;
assert_checkequal(size(a), [1 3]);
a{5}.b = 2;
assert_checkequal(size(a), [1 5]);
a{2,3}.b = 2;
assert_checkequal(size(a), [2 5]);
clear a;

a{1,3} = 2;
assert_checkequal(size(a), [1 3]);
a{5} = 2;
assert_checkequal(size(a), [1 5]);
a{2,3} = 2;
assert_checkequal(size(a), [2 5]);
clear a;

tl = tlist(["mytlist", "f1"], 12);
ml = mlist(["mymlist", "f"], tl);
mml = mlist(["mymmlist", "ff1"], ml);

mml(list("ff1", "f", 2)) = 14;

assert_checkequal(tl.f1, 12);
assert_checkequal(ml.f.f1, 12);
assert_checkequal(mml.ff1.f.f1, 14);

funcprot(oldFuncProt);


// multiple insertion in struct
function r = initst()
    r.f.e = list()
    r.f(3).e = 3
endfunction

st=initst();
st.f(:).e = 5;
assert_checkequal(st.f.e, list(5,5,5));

st=initst();
st.f(1:4).e = 5;
assert_checkequal(st.f.e, list(5,5,5,5));

st=initst();
err=execstr("st.f(1:2).e(2) = 5;", "errcatch");
assert_checktrue(err <> 0);

st=initst();
err=execstr("st(1:2).f(1:4).e = 5;", "errcatch");
assert_checktrue(err <> 0);

// insert without arguments
errmsg = msprintf(gettext("Wrong insertion : Cannot insert without arguments."));
assert_checkerror("a()=1;", errmsg);
assert_checkerror("a{}=1;", errmsg);
a=1;
assert_checkerror("a()=1;", errmsg);

// insertion on element with ref > 1
origin = list(list([]));
origin(1)(1).test = 1;
twin = origin;
twin(1)(1).test = 5;
assert_checkequal(origin(1)(1).test, 1);
assert_checkequal(twin(1)(1).test, 5);

twin = origin(1);
twin(1).test = 5;
assert_checkequal(origin(1)(1).test, 1);
assert_checkequal(twin(1).test, 5);

twin=origin(1)(1);
twin.test = 5;
assert_checkequal(origin(1)(1).test, 1);
assert_checkequal(twin.test, 5);

// insert in sparse with invalid index
a=spzeros(3,3);
errMsg = msprintf(_("Invalid index.\n"));
assert_checkerror("a(0) = 1", errMsg);
