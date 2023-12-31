//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

double_b = double([1. 120. 127. 31.]);
int8_b = int8([1. 120. 127. 31.]);
uint8_b = uint8([1. 120. 127. 31.]);
int16_b = int16([1. 120. 127. 31.]);
uint16_b = uint16([1. 120. 127. 31.]);
int32_b = int32([1. 120. 127. 31.]);
uint32_b = uint32([1. 120. 127. 31.]);

function test_iconvert(b)
  y = iconvert(b, 0);
  assert_checkequal(y, double(b));
  assert_checkequal(inttype(y), 0);
  y = iconvert(b, 1);
  assert_checkequal(y, int8(b));
  assert_checkequal(inttype(y), 1);
  y = iconvert(b, 11);
  assert_checkequal(y, uint8(b));
  assert_checkequal(inttype(y), 11);
  y = iconvert(b, 2);
  assert_checkequal(y, int16(b));
  assert_checkequal(inttype(y), 2);
  y = iconvert(b, 12);
  assert_checkequal(y, uint16(b));
  assert_checkequal(inttype(y), 12);
  y = iconvert(b, 4);
  assert_checkequal(y, int32(b));
  assert_checkequal(inttype(y), 4);
  y = iconvert(b, 14);
  assert_checkequal(y, uint32(b));
  assert_checkequal(inttype(y), 14);
endfunction

test_iconvert(double_b);
test_iconvert(int8_b);
test_iconvert(uint8_b);
test_iconvert(int16_b);
test_iconvert(uint16_b);
test_iconvert(int32_b);
test_iconvert(uint32_b);

