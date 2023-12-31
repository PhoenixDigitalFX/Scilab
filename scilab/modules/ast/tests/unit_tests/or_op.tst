// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Antoine ELIAS
// Copyright (C) 2020 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

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


assert_checkequal(empty | empty, []);
assert_checkequal(empty | r, []);
assert_checkequal(empty | R, []);
assert_checkequal(empty | c, []);
assert_checkequal(empty | C, []);
assert_checkequal(empty | e, []);
assert_checkequal(empty | b, %t);
assert_checkequal(empty | B, [%t %t;%t %t]);

assert_checkequal(r | empty, []);
assert_checkequal(r | r, %t);
assert_checkequal(r | R, [%t,%t;%t,%t]);
assert_checkequal(r | c, %t);
assert_checkequal(r | C, [%t,%t;%t,%t]);
assert_checkequal(r | e, %t);
assert_checkequal(r | b, %t);
assert_checkequal(r | B, [%t,%t;%t,%t]);

assert_checkequal(R | empty, []);
assert_checkequal(R | r, [%t,%t;%t,%t]);
assert_checkequal(R | R, [%t,%t;%t,%t]);
assert_checkequal(R | c, [%t,%t;%t,%t]);
assert_checkequal(R | C, [%t,%t;%t,%t]);
assert_checkequal(R | e, [%t,%t;%t,%t]);
assert_checkequal(R | b, [%t,%t;%t,%t]);
assert_checkequal(R | B, [%t,%t;%t,%t]);

assert_checkequal(c | empty, []);
assert_checkequal(c | r, %t);
assert_checkequal(c | R, [%t,%t;%t,%t]);
assert_checkequal(c | c, %t);
assert_checkequal(c | C, [%t,%t;%t,%t]);
assert_checkequal(c | e, %t);
assert_checkequal(c | b, %t);
assert_checkequal(c | B, [%t,%t;%t,%t]);

assert_checkequal(C | empty, []);
assert_checkequal(C | r, [%t,%t;%t,%t]);
assert_checkequal(C | R, [%t,%t;%t,%t]);
assert_checkequal(C | c, [%t,%t;%t,%t]);
assert_checkequal(C | C, [%t,%t;%t,%t]);
assert_checkequal(C | e, [%t,%t;%t,%t]);
assert_checkequal(C | b, [%t,%t;%t,%t]);
assert_checkequal(C | B, [%t,%t;%t,%t]);

assert_checkequal(e | empty, []);
assert_checkequal(e | r, %t);
assert_checkequal(e | R, [%t,%t;%t,%t]);
assert_checkequal(e | c, %t);
assert_checkequal(e | C, [%t,%t;%t,%t]);
assert_checkequal(e | b, %t);
assert_checkequal(e | B, [%t,%t;%t,%t]);

assert_checkequal(b | empty, %t);
assert_checkequal(b | r, %t);
assert_checkequal(b | R, [%t,%t;%t,%t]);
assert_checkequal(b | c, %t);
assert_checkequal(b | C, [%t,%t;%t,%t]);
assert_checkequal(b | e, %t);
assert_checkequal(b | b, %f);
assert_checkequal(b | B, [%t,%f;%f,%t]);
assert_checkequal(b | SPB, sparse([1,2;2,1],[%t;%t],[2,2]));

assert_checkequal(B | empty, [%t,%t;%t,%t]);
assert_checkequal(B | r, [%t,%t;%t,%t]);
assert_checkequal(B | R, [%t,%t;%t,%t]);
assert_checkequal(B | c, [%t,%t;%t,%t]);
assert_checkequal(B | C, [%t,%t;%t,%t]);
assert_checkequal(B | e, [%t,%t;%t,%t]);
assert_checkequal(B | b, [%t,%f;%f,%t]);
assert_checkequal(B | B, [%t,%f;%f,%t]);
assert_checkequal(B | SPB, sparse([1,1;1,2;2,1;2,2],[%t;%t;%t;%t],[2,2]));

assert_checkequal(SPB | b, sparse([1,2;2,1],[%t;%t],[2,2]));
assert_checkequal(SPB | B, sparse([1,1;1,2;2,1;2,2],[%t;%t;%t;%t],[2,2]));
assert_checkequal(SPB | SPB, sparse([1,2;2,1],[%t;%t],[2,2]));

