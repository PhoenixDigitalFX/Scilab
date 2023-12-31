//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 2132 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2132
//
// <-- Short Description -->
//The expression a*-b+c gets interpreted as a*(-b+c) and not as a*(-b)+c.

a=3;if 2*-a+1<>-5 then pause,end
a=[1 2 3];if or(2*-a.^2<>-[2 8 18]) then pause,end
if or(2*-a'<>-[2 4 6]') then pause,end

//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1107
//
// <-- Short Description -->
if 2*+3+1<>7 then pause,end
if or(2*+[1 2 3].^2<>[2 8 18]) then pause,end
if or(2*+[1 2 3]'<>+[2 4 6]') then pause,end

if 2*-3+1<>-5 then pause,end
if or(2*-[1 2 3].^2<>-[2 8 18]) then pause,end
if or(2*-[1 2 3]'<>-[2 4 6]') then pause,end

if 2*-+--3+1<>-5 then pause,end
if or(2*-+--[1 2 3].^2<>-[2 8 18]) then pause,end
if or(2*-+--[1 2 3]'<>-[2 4 6]') then pause,end



a=3;if 2*+a+1<>7 then pause,end
a=[1 2 3];if or(2*+a.^2<>[2 8 18]) then pause,end
if or(2*+a'<>[2 4 6]') then pause,end


a=3;if 2*-a+1<>-5 then pause,end
a=[1 2 3];if or(2*-a.^2<>-[2 8 18]) then pause,end
if or(2*-a'<>-[2 4 6]') then pause,end
