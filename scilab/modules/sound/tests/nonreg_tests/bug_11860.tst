// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 11860 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11860
//
// <-- Short Description -->
// wavwrite failed for 24 bits files (error in savewave function)
//
// For two channels
filename=SCI +'/modules/sound/tests/nonreg_tests/bug_11860.wav';
[y_ref,Fs_ref,nbits_ref]=wavread(filename);
wavwrite(y_ref,Fs_ref,nbits_ref,TMPDIR + '/bug_11860_written.wav');
filename_written=TMPDIR + '/bug_11860_written.wav';
// Check
[y,Fs,nbits]=wavread(filename_written);
assert_checktrue(abs(y_ref-y)<1e-6);
assert_checkalmostequal(Fs,Fs_ref);
assert_checkalmostequal(nbits,nbits_ref);
mdelete(filename_written);

// For 1 channel
filepath= TMPDIR + '/bug_11860_mono.wav';
Fs_ref = 44100;
nbits_ref = 24;
recordLength=1;
t= 0 : 1/Fs_ref : recordLength*(1-%eps);
// Signal
frequency = 1000;
y_ref = 0.5*sin(2*%pi* frequency *t);
// Output
wavwrite(y_ref, Fs_ref, nbits_ref, filepath);
// Check
[y,Fs,nbits]=wavread(filepath);
assert_checktrue(abs(y_ref-y)<1e-6);
assert_checkalmostequal(Fs,Fs_ref);
assert_checkalmostequal(nbits,nbits_ref);
mdelete(filepath);
