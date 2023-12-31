// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// Test 1
// =============================================================================

if execstr("getmd5(123)","errcatch")                         == 0 then pause, end
if execstr("getmd5(''"+TMPDIR+"/phantom_file'')","errcatch") == 0 then pause, end


// Test 2
// =============================================================================

A = "";
if getmd5(A,"string") <> "d41d8cd98f00b204e9800998ecf8427e" then pause, end


// Test 3
// =============================================================================

A = "$$$$$$$$$$$";
if getmd5(A,"string") <> "d4b8e88a8b72f9ce207063d7b0a17787" then pause, end

// Test 4
// =============================================================================

A = [ 'abcd' 'efgh' ; 'ijkl' 'mnop' ];
B = [ 'e2fc714c4727ee9395f324cd2e7f331f' '1f7690ebdd9b4caf8fab49ca1757bf27' ; ..
      '09a0877d04abf8759f99adec02baf579' 'e132e96a5ddad6da8b07bba6f6131fef' ];

if getmd5(A,"string") <> B then pause, end

// Test 5
// =============================================================================

A = [ 'abcd' 'efgh' 'ijkl' 'mnop' ];
B = [ 'e2fc714c4727ee9395f324cd2e7f331f' '1f7690ebdd9b4caf8fab49ca1757bf27' ..
      '09a0877d04abf8759f99adec02baf579' 'e132e96a5ddad6da8b07bba6f6131fef' ];

if getmd5(A,"string") <> B then pause, end

// Test 6
// =============================================================================

A = [ 'abcd' ; 'efgh' ; 'ijkl' ; 'mnop' ];
B = [ 'e2fc714c4727ee9395f324cd2e7f331f' ; '1f7690ebdd9b4caf8fab49ca1757bf27' ; ..
      '09a0877d04abf8759f99adec02baf579' ; 'e132e96a5ddad6da8b07bba6f6131fef' ];

if getmd5(A,"string") <> B then pause, end

// Test 7
// =============================================================================

if or(size(getmd5( SCI+'/modules/core/etc/'+['core.start' 'core.quit'])) <> [1 2]) then pause, end
