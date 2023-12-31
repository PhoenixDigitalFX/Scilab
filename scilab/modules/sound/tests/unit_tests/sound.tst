//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// At first we create a time vector of 0.5 seconds sampled at 22050 Hz:
t = 0 : 1/22050 : 0.5*(1-%eps);

// Then we generate the sound.
s = sin(440*t) + sin(220*t)/2 + sin(880*t)/2;
[nr,nc] = size(t);
s(nc/2:nc) = sin(330*t(nc/2:nc));

// Save the file in WAV format.
// we renormalize s in order to check that save+load is invariant
s = s - sum(s)/prod(size(s));
s = s / max(abs(s));
savewave(TMPDIR+"/test.wav",s);

// Load it back.
s1 = loadwave(TMPDIR+"/test.wav");
if max(abs(s1-s)) > 1.e-4 then pause,end;

