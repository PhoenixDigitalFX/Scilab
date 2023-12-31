// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7951 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7951
//
// <-- Short Description -->
// strcat crashed with row concatenation option on linux.
//

ref = "line1, line2";
if execstr("r = strcat([""line1"";""line2""], "", "", ""r"")", "errcatch") <> 0 then pause, end
if ref <> r then pause, end

ref = "line1,line2";
r = strcat(['line1';'line2'],',','r');
if ref <> r then pause, end

ref = "line1,blafdfdfdfdfffffffffffffffdfdfline2";
r = strcat(['line1';'line2'],',blafdfdfdfdfffffffffffffffdfdf','r');
if ref <> r then pause, end

num = 30;
baseName = "arg_";
labels = [];
typ = list();
values = string(1:num)';
for i=1:num
  varName = baseName + string(i);

  // variable declaration
  execstr(varName + " = []");

  // description update
  labels = [labels; varName];

  // typ update
  typ(i * 2 - 1) = "mat";
  typ(i * 2) = [1 1];
end

argout = strcat(labels, ", ", 'r');
ref = "arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10, arg_11, arg_12, arg_13, arg_14, arg_15, arg_16, arg_17, " + ..
"arg_18, arg_19, arg_20, arg_21, arg_22, arg_23, arg_24, arg_25, arg_26, arg_27, arg_28, arg_29, arg_30";
if ref <> argout then pause, end

