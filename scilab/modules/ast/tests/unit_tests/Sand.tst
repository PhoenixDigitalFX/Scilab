// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Antoine ELIAS
// Copyright (C) 2017 - Scilab Enterprises - Clement DAVID
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================
//
// <-- NO CHECK REF -->
// <-- CLI SHELL MODE -->

empty = [];
r = 2;
R = [1,2;3,4];
R3(:,:,1) = R;
R3(:,:,2) = R';
c = 1 + 2*%i;
C = [1+2*%i,2+4*%i;3+6*%i,4+8*%i];
C3(:,:,1) = C;
C3(:,:,2) = C';
e = eye();
ec = (5+%i) * eye();
p = 1 + %s - %s**2;
pc = 1 + %s - %s**2 + ( 2 - 3 * %s + 4 * %s**2 ) * %i;
P = [2*p, -3*p;4*p,-5*p];
PC = [2*pc, -3*pc;4*pc,-5*pc];
SP = sparse([1,2;4,5;3,10],[1,2,3]);
SPC = sparse([1,2;4,5;3,10],[1,2,3]) * ( 1 + 4*%i);
SPB = sparse([1,2;2,1],[%t;%t],[2,2]);

i8 = int8(-8);
ui8 = uint8(8);
I8 = int8([-8 -16 ; -24 -32]);
UI8 = uint8([8 16 ; 24 32]);

I16 = int16([-16 -32 ; -48 -64]);
UI16 = uint16([16 32 ; 48 64]);
i16 = int16(-16);
ui16 = uint16(16);

i32 = int32(-32);
ui32 = uint32(32);
I32 = int32([-32 -64 ; -96 -128]);
UI32 = uint32([32 64 ; 96 128]);

str = "string";
STR = ["string1" "string2";"string3" "string4"];

b = %f;
B = [%t %f;%f %t];

assert_checkequal(empty && empty, %f);
assert_checkequal(empty && r, %f);
assert_checkequal(empty && R, %f);
assert_checkequal(empty && e, %f);
assert_checkequal(empty && b, %f);
assert_checkequal(empty && B, %f);

assert_checkequal(r && empty, %f);
assert_checkequal(r && r, %t);
assert_checkequal(r && R, %t);
assert_checkequal(r && e, %t);
assert_checkequal(r && b, %f);
assert_checkequal(r && B, %f);

assert_checkequal(R && empty, %f);
assert_checkequal(R && r, %t);
assert_checkequal(R && R, %t);
assert_checkequal(R && e, %t);
assert_checkequal(R && b, %f);
assert_checkequal(R && B, %f);

assert_checkequal(e && empty, %f);
assert_checkequal(e && r, %t);
assert_checkequal(e && R, %t);
assert_checkequal(e && b, %f);
assert_checkequal(e && B, %f);

assert_checkequal(b && empty, %f);
assert_checkequal(b && r, %f);
assert_checkequal(b && R, %f);
assert_checkequal(b && e, %f);
assert_checkequal(b && b, %f);
assert_checkequal(b && B, %f);
assert_checkequal(b && SPB, %f);

assert_checkequal(B && empty, %f);
assert_checkequal(B && r, %f);
assert_checkequal(B && R, %f);
assert_checkequal(B && e, %f);
assert_checkequal(B && b, %f);
assert_checkequal(B && B, %f);
assert_checkequal(B && SPB, %f);

assert_checkequal(SPB && b, %f);
assert_checkequal(SPB && B, %f);
assert_checkequal(SPB && SPB, %f);

assert_checkequal(i8 && i8, %t);
assert_checkequal(i8 && I8, %t);
assert_checkequal(i8 && ui8, %t);
assert_checkequal(i8 && UI8, %t);
assert_checkequal(i8 && i16, %t);
assert_checkequal(i8 && I16, %t);
assert_checkequal(i8 && ui16, %t);
assert_checkequal(i8 && UI16, %t);
assert_checkequal(i8 && i32, %t);
assert_checkequal(i8 && I32, %t);
assert_checkequal(i8 && ui32, %t);
assert_checkequal(i8 && UI32, %t);

assert_checkequal(I8 && i8, %t);
assert_checkequal(I8 && I8, %t);
assert_checkequal(I8 && ui8, %f);
assert_checkequal(I8 && UI8, %t);
assert_checkequal(I8 && i16, %t);
assert_checkequal(I8 && I16, %t);
assert_checkequal(I8 && ui16, %f);
assert_checkequal(I8 && UI16, %t);
assert_checkequal(I8 && i32, %t);
assert_checkequal(I8 && I32, %t);
assert_checkequal(I8 && ui32, %t);
assert_checkequal(I8 && UI32, %t);

assert_checkequal(ui8 && i8, %t);
assert_checkequal(ui8 && I8, %f);
assert_checkequal(ui8 && ui8, %t);
assert_checkequal(ui8 && UI8, %f);
assert_checkequal(ui8 && i16, %f);
assert_checkequal(ui8 && I16, %f);
assert_checkequal(ui8 && ui16, %f);
assert_checkequal(ui8 && UI16, %f);
assert_checkequal(ui8 && i32, %f);
assert_checkequal(ui8 && I32, %f);
assert_checkequal(ui8 && ui32, %f);
assert_checkequal(ui8 && UI32, %f);

assert_checkequal(UI8 && i8, %t);
assert_checkequal(UI8 && I8, %t);
assert_checkequal(UI8 && ui8, %f);
assert_checkequal(UI8 && UI8, %t);
assert_checkequal(UI8 && i16, %f);
assert_checkequal(UI8 && I16, %f);
assert_checkequal(UI8 && ui16, %f);
assert_checkequal(UI8 && UI16, %f);
assert_checkequal(UI8 && i32, %f);
assert_checkequal(UI8 && I32, %f);
assert_checkequal(UI8 && ui32, %f);
assert_checkequal(UI8 && UI32, %f);

assert_checkequal(i16 && i8, %t);
assert_checkequal(i16 && I8, %t);
assert_checkequal(i16 && ui8, %f);
assert_checkequal(i16 && UI8, %f);
assert_checkequal(i16 && i16, %t);
assert_checkequal(i16 && I16, %t);
assert_checkequal(i16 && ui16, %t);
assert_checkequal(i16 && UI16, %t);
assert_checkequal(i16 && i32, %t);
assert_checkequal(i16 && I32, %t);
assert_checkequal(i16 && ui32, %t);
assert_checkequal(i16 && UI32, %t);

assert_checkequal(I16 && i8, %t);
assert_checkequal(I16 && I8, %t);
assert_checkequal(I16 && ui8, %f);
assert_checkequal(I16 && UI8, %f);
assert_checkequal(I16 && i16, %t);
assert_checkequal(I16 && I16, %t);
assert_checkequal(I16 && ui16, %f);
assert_checkequal(I16 && UI16, %t);
assert_checkequal(I16 && i32, %t);
assert_checkequal(I16 && I32, %t);
assert_checkequal(I16 && ui32, %f);
assert_checkequal(I16 && UI32, %t);

assert_checkequal(ui16 && i8, %t);
assert_checkequal(ui16 && I8, %f);
assert_checkequal(ui16 && ui8, %f);
assert_checkequal(ui16 && UI8, %f);
assert_checkequal(ui16 && i16, %t);
assert_checkequal(ui16 && I16, %f);
assert_checkequal(ui16 && ui16, %t);
assert_checkequal(ui16 && UI16, %f);
assert_checkequal(ui16 && i32, %f);
assert_checkequal(ui16 && I32, %f);
assert_checkequal(ui16 && ui32, %f);
assert_checkequal(ui16 && UI32, %f);

assert_checkequal(UI16 && i8, %t);
assert_checkequal(UI16 && I8, %t);
assert_checkequal(UI16 && ui8, %f);
assert_checkequal(UI16 && UI8, %f);
assert_checkequal(UI16 && i16, %t);
assert_checkequal(UI16 && I16, %t);
assert_checkequal(UI16 && ui16, %f);
assert_checkequal(UI16 && UI16, %t);
assert_checkequal(UI16 && i32, %f);
assert_checkequal(UI16 && I32, %f);
assert_checkequal(UI16 && ui32, %f);
assert_checkequal(UI16 && UI32, %f);

assert_checkequal(i32 && i8, %t);
assert_checkequal(i32 && I8, %t);
assert_checkequal(i32 && ui8, %f);
assert_checkequal(i32 && UI8, %f);
assert_checkequal(i32 && i16, %t);
assert_checkequal(i32 && I16, %t);
assert_checkequal(i32 && ui16, %f);
assert_checkequal(i32 && UI16, %f);
assert_checkequal(i32 && i32, %t);
assert_checkequal(i32 && I32, %t);
assert_checkequal(i32 && ui32, %t);
assert_checkequal(i32 && UI32, %t);

assert_checkequal(I32 && i8, %t);
assert_checkequal(I32 && I8, %t);
assert_checkequal(I32 && ui8, %f);
assert_checkequal(I32 && UI8, %f);
assert_checkequal(I32 && i16, %t);
assert_checkequal(I32 && I16, %t);
assert_checkequal(I32 && ui16, %f);
assert_checkequal(I32 && UI16, %f);
assert_checkequal(I32 && i32, %t);
assert_checkequal(I32 && I32, %t);
assert_checkequal(I32 && ui32, %f);
assert_checkequal(I32 && UI32, %t);

assert_checkequal(ui32 && i8, %t);
assert_checkequal(ui32 && I8, %t);
assert_checkequal(ui32 && ui8, %f);
assert_checkequal(ui32 && UI8, %f);
assert_checkequal(ui32 && i16, %t);
assert_checkequal(ui32 && I16, %f);
assert_checkequal(ui32 && ui16, %f);
assert_checkequal(ui32 && UI16, %f);
assert_checkequal(ui32 && i32, %t);
assert_checkequal(ui32 && I32, %f);
assert_checkequal(ui32 && ui32, %t);
assert_checkequal(ui32 && UI32, %f);

assert_checkequal(UI32 && i8, %t);
assert_checkequal(UI32 && I8, %t);
assert_checkequal(UI32 && ui8, %f);
assert_checkequal(UI32 && UI8, %f);
assert_checkequal(UI32 && i16, %t);
assert_checkequal(UI32 && I16, %t);
assert_checkequal(UI32 && ui16, %f);
assert_checkequal(UI32 && UI16, %f);
assert_checkequal(UI32 && i32, %t);
assert_checkequal(UI32 && I32, %t);
assert_checkequal(UI32 && ui32, %f);
assert_checkequal(UI32 && UI32, %t);

