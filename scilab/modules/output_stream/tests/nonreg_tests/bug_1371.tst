// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1371 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1371
//
// <-- Short Description -->
// Incorrect output representation of floating numbers with exponent larger than 100 or smaller than -100.
format(10,"e")
if string(1.78945d88)<>"1.789D+88"  then pause,end
if string(1.2345d123)<>"1.23D+123" then pause,end
if string(-1.78945d88)<>"-1.789D+88"  then pause,end
if string(-1.2345d123)<>"-1.23D+123" then pause,end


if string(1.78945d-88)<>"1.789D-88"  then pause,end
if string(1.2345d-123)<>"1.23D-123" then pause,end
if string(-1.78945d-88)<>"-1.789D-88"  then pause,end
if string(-1.2345d-123)<>"-1.23D-123" then pause,end

format(10,"v")
if string(1.78945d88+%i)<>"1.789D+88+%i"  then pause,end
if string(1.2345d123+%i)<>"1.23D+123+%i" then pause,end
if string(-1.78945d88-%i)<>"-1.789D+88-%i"  then pause,end
if string(-1.2345d123+3.33*%i)<>"-1.23D+123+%i*3.33" then pause,end
if string(1.2345d-123*%i)<>"%i*1.23D-123" then pause,end





format(15,"e")
if string(1.7894567d88)<>"1.78945670D+88"  then pause,end

if string(1.2345678d123)<>"1.2345678D+123" then pause,end
if string(-1.7894567d88)<>"-1.78945670D+88"  then pause,end

if string(-1.2345678d123)<>"-1.2345678D+123" then pause,end

if string(1.7894567d-88)<>"1.78945670D-88"  then pause,end

if string(1.2345678d-123)<>"1.2345678D-123" then pause,end
if string(-1.7894567d-88)<>"-1.78945670D-88"  then pause,end

if string(-1.2345678d-123)<>"-1.2345678D-123" then pause,end



format(10,"v")

A=[1.7894567d120  1.2345678d123
4.2345678d123 -7.7894567d120];
if or(string(A)<>["1.79D+120","1.23D+123";"4.23D+123","-7.79D+120"]) then pause,end


A=[1.7894567d120+%i  1.2345678*%i
4.2345678d123 -7.7894567d120-2.45*%i];
if or(string(A)<> ["1.79D+120+%i","%i*1.2345678";"4.23D+123","-7.79D+120-%i*2.45"]) then pause,end


P=1.2345678d-123-1.7894567d88*%s;
if or(string(P)<>"1.23D-123 -1.789D+88s" ) then pause,end
