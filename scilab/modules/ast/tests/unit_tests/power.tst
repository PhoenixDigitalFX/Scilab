// ============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

r = 2;
R = [1,2;3,4];
c = 1 + 2*%i;
C = [1+2*%i,2+4*%i;3+6*%i,4+8*%i];
pR = 1 + 2*%s*%s + 3*%s*%s*%s;
pC = pR + pR*%i;
PR = [pR,pR;pR,pR];
PC = [pC,pC;pC,pC];


//DOUBLE

// double ^ double

//r ^ r
assert_checkalmostequal(r ^ r, 4);
//r ^ c

assert_checkalmostequal(r ^ c, 0.3669139494866+%i*1.9660554808225);
//c ^ r
assert_checkequal(c ^ r, -3+%i*4);
//c ^ c
assert_checkalmostequal(c ^ c, -0.2225171568018+%i*0.1007091311361);

// DOUBLE ^ double
//R ^ r
assert_checkequal(R ^ r, [7,10;15,22]);
//R ^ c
assert_checkalmostequal(R ^ c, [-1.251952645008-%i*0.28072150763376,-1.825029337717-%i*0.410062225781;-2.7375440065755-%i*0.61509333867145,-3.9894966515835-%i*0.89581484630521]);
//C ^ r
assert_checkequal(C ^ r, [-21+%i*28,-30+%i*40;-45+%i*60,-66+%i*88]);
//C ^ c
assert_checkalmostequal(C ^ c, [-27.051150278703-%i*25.062777693306, 12.961689280285+%i*11.342742208568; 19.442533920428+%i*17.014113312852,-7.6086163582745-%i*8.048664380454]);

// double ^ DOUBLE
//r ^ R
assert_checkalmostequal(r ^ R, expm(log(r) * R));
//r ^ C
assert_checkalmostequal(r ^ C, expm(log(r) * C));
//c ^ R
assert_checkalmostequal(c ^ R, expm(log(c) * R));
//c ^ C
assert_checkalmostequal(c ^ C, expm(log(c) * C));

r1 = [1, -2.32, 1] .^ -1.123;
assert_checkalmostequal(r1, [1, -0.359991792326739168395+0.1464703519103459083972*%i, 1]);
msg2 = msprintf(_("%s: Wrong size for input argument #%d: Square matrix expected.\n"), "%s_pow", 1);
assert_checkerror("r2 = [1, -2.32, 1] ^ -1.123;", msg2);


//POLY

//poly ^ double

//pR ^ r
assert_checkequal(pR ^ r, 1+4*%s^2+6*%s^3+4*%s^4+12*%s^5+9*%s^6);
//pC ^ r
assert_checkequal(pC ^ r, %i*2+(%i*8)*%s^2+(%i*12)*%s^3+(%i*8)*%s^4+(%i*24)*%s^5+(%i*18)*%s^6);

//poly ^ DOUBLE

//pR ^ R
assert_checkequal(pR ^ R, [1+2*%s^2+3*%s^3,1+4*%s^2+6*%s^3+4*%s^4+12*%s^5+9*%s^6;1+6*%s^2+9*%s^3+12*%s^4+36*%s^5+35*%s^6+36*%s^7+54*%s^8+27*%s^9,1+8*%s^2+12*%s^3+24*%s^4+72*%s^5+86*%s^6+144*%s^7+232*%s^8+204*%s^9+216*%s^10+216*%s^11+81*%s^12]);
//pC ^ R
assert_checkequal(pC ^ R, [1+%i+(2+%i*2)*%s^2+(3+%i*3)*%s^3,%i*2+(%i*8)*%s^2+(%i*12)*%s^3+(%i*8)*%s^4+(%i*24)*%s^5+(%i*18)*%s^6;-2+%i*2+(-12+%i*12)*%s^2+(-18+%i*18)*%s^3+(-24+%i*24)*%s^4+(-72+%i*72)*%s^5+(-70+%i*70)*%s^6+(-72+%i*72)*%s^7+(-108+%i*108)*%s^8+(-54+%i*54)*%s^9,-4-32*%s^2-48*%s^3-96*%s^4-288*%s^5-344*%s^6-576*%s^7-928*%s^8-816*%s^9-864*%s^10-864*%s^11-324*%s^12]);

//POLY ^ double
//PR ^ r
assert_checkequal(PR ^ r, [2+8*%s^2+12*%s^3+8*%s^4+24*%s^5+18*%s^6,2+8*%s^2+12*%s^3+8*%s^4+24*%s^5+18*%s^6;2+8*%s^2+12*%s^3+8*%s^4+24*%s^5+18*%s^6,2+8*%s^2+12*%s^3+8*%s^4+24*%s^5+18*%s^6]);
//PC ^ r
assert_checkequal(PC ^ r, [%i*4+(%i*16)*%s^2+(%i*24)*%s^3+(%i*16)*%s^4+(%i*48)*%s^5+(%i*36)*%s^6,%i*4+(%i*16)*%s^2+(%i*24)*%s^3+(%i*16)*%s^4+(%i*48)*%s^5+(%i*36)*%s^6;%i*4+(%i*16)*%s^2+(%i*24)*%s^3+(%i*16)*%s^4+(%i*48)*%s^5+(%i*36)*%s^6,%i*4+(%i*16)*%s^2+(%i*24)*%s^3+(%i*16)*%s^4+(%i*48)*%s^5+(%i*36)*%s^6]);


// Error handling for non-square matrices
msg1 = msprintf(_("%s: Wrong size for input argument #%d: Square matrix expected.\n"), "%s_pow", 2);
msg2 = msprintf(_("%s: Wrong size for input argument #%d: Square matrix expected.\n"), "%s_pow", 1);

NonSquare = [1 2; 3 4; 5 6];
assert_checkerror("2^NonSquare", msg1);
assert_checkerror("NonSquare^2", msg2);
