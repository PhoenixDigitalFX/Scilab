// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
// Copyright (C) 2010 - DIGITEO - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->

//type

// Special cases
if type(%nan) <> 1 then pause,end
if type(%inf) <> 1 then pause,end


// double <-> 1
if type(1) <> 1 then pause,end

// polynomial <-> 2
if type(poly(0,"x")) <> 2 then pause,end

// boolean
if type(%t) <> 4 then pause,end
if type(%f) <> 4 then pause,end

// sparse <-> 5
if type(sparse([1,2;4,5;3,10],[1,2,3])) <> 5 then pause,end

// boolean sparse <-> 6
if type(sparse([1,2;4,5;3,10], [%t,%t, %t])) <> 6 then pause,end

// int <-> 8
if type(int8(0)) <> 8 then pause,end
if type(uint8(0)) <> 8 then pause,end
if type(int16(0)) <> 8 then pause,end
if type(uint16(0)) <> 8 then pause,end
if type(int32(0)) <> 8 then pause,end
if type(uint32(0)) <> 8 then pause,end

// handle <-> 9
if type(gdf()) <> 9 then pause,end

// string <-> 10
if type("scilab") <> 10 then pause,end

// scilab macro <-> 13
deff("__private__()","");
if type(__private__) <> 13 then pause,end
clear __private__;

// library <-> 14
if type(corelib) <> 14 then pause,end

// list <-> 15
if type(list(1,2,3)) <> 15 then pause,end

// tlist <-> 16
if type(tlist("mytype",2,3)) <> 16 then pause,end

// mlist <-> 17
if type(mlist("mytype",2,3)) <> 17 then pause,end

// struct <-> 17
if type(struct()) <> 17 then pause,end

// cell <-> 17
if type(cell(1,1)) <> 17 then pause,end

// pointer <-> 128
a=rand(5,5);
b=rand(5,1);
A=sparse(a);
[h,rk]=lufact(A);
if type(h) <> 128 then pause,end
clear a;
clear b;
clear A;
clear rk;
ludel(h);
clear h;

// GW function
if type(type) <> 130 then pause,end

