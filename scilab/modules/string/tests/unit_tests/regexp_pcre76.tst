// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

//===============================
// unit tests regexp
//===============================
// Comments about PCRE 7.6 see changelog PCRE
//7.  Patterns such as (?(1)a|b) (a pattern that contains fewer subpatterns
//  than the number used in the conditional) now cause a compile-time error.
//  This is actually not compatible with Perl, which accepts such patterns, but
//  treats the conditional as always being FALSE (as PCRE used to), but it
//    seems to me that giving a diagnostic is better.
if execstr("regexp(''a'' ,''/(?(1)a|b)/'')","errcatch") <>  999  then pause,end
if execstr("regexp(''a'',''/(?(?{0})a|b)/'')","errcatch") <>  999  then pause,end
if execstr("regexp(''a'',''/(?(?{1})b|a)/'')","errcatch") <>  999  then pause,end
if execstr("regexp(''a'',''/(?(1)b|a)/'')","errcatch") <>  999  then pause,end
