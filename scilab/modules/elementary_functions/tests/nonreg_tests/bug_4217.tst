// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 4217 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4217
//
// <-- Short Description -->
//  gsort sort complex by magnitude only with 'g' and not support 'r', 'c', 'lr', 'lc'
// =============================================================================
cplx = [1+%i,2+2*%i,3+3*%i;6+4*%i,4+5*%i,5+6*%i];
realpart_cplx = real(cplx);
imagpart_cplx = imag(cplx);
mag_cplx = abs(cplx);
// =============================================================================
[s,k] = gsort(mag_cplx);
[s0,k0] = gsort(cplx);
if and(size(s) <> size(s0)) then pause,end
if and(size(k) <> size(k0)) then pause,end
if ~and(k == k0) then pause,end
if ~and(s == abs(s0)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"r");
[s1,k1] = gsort(cplx,"r");
if and(size(s) <> size(s1)) then pause,end
if and(size(k) <> size(k1)) then pause,end
if ~and(k == k1) then pause,end
if ~and(s == abs(s1)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"r","i");
[s1,k1] = gsort(cplx,"r","i");
if and(size(s) <> size(s1)) then pause,end
if and(size(k) <> size(k1)) then pause,end
if ~and(k == k1) then pause,end
if ~and(s == abs(s1)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"r","d");
[s2,k2] = gsort(cplx,"r","d");
if and(size(s) <> size(s2)) then pause,end
if and(size(k) <> size(k2)) then pause,end
if ~and(k == k2) then pause,end
if ~and(s == abs(s2)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"r","i");
[s3,k3] = gsort(cplx,"r","i");
if and(size(s) <> size(s3)) then pause,end
if and(size(k) <> size(k3)) then pause,end
if ~and(k == k3) then pause,end
if ~and(s == abs(s3)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"c","d");
[s4,k4] = gsort(cplx,"c","d");
if and(size(s) <> size(s4)) then pause,end
if and(size(k) <> size(k4)) then pause,end
if ~and(k == k4) then pause,end
if ~and(s == abs(s4)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"g","i");
[s5,k5] = gsort(cplx,"g","i");
if and(size(s) <> size(s5)) then pause,end
if and(size(k) <> size(k5)) then pause,end
if ~and(k == k5) then pause,end
if ~and(s == abs(s5)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"g","d");
[s6,k6] = gsort(cplx,"g","d");
if and(size(s) <> size(s6)) then pause,end
if and(size(k) <> size(k6)) then pause,end
if ~and(k == k6) then pause,end
if ~and(s == abs(s6)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"lr","i");
[s7,k7] = gsort(cplx,"lr","i");
if and(size(s) <> size(s7)) then pause,end
if and(size(k) <> size(k7)) then pause,end
if ~and(k == k7) then pause,end
if ~and(s == abs(s7)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"lr","d");
[s8,k8] = gsort(cplx,"lr","d");
if and(size(s) <> size(s8)) then pause,end
if and(size(k) <> size(k8)) then pause,end
if ~and(k == k8) then pause,end
if ~and(s == abs(s8)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"lc","i");
[s9,k9] = gsort(cplx,"lc","i");
if and(size(s) <> size(s9)) then pause,end
if and(size(k) <> size(k9)) then pause,end
if ~and(k == k9) then pause,end
if ~and(s == abs(s9)) then pause,end
// =============================================================================
[s,k] = gsort(mag_cplx,"lc","d");
[s10,k10] = gsort(cplx,"lc","d");
if and(size(s) <> size(s10)) then pause,end
if and(size(k) <> size(k10)) then pause,end
if ~and(k == k10) then pause,end
if ~and(s == abs(s10)) then pause,end
// =============================================================================
