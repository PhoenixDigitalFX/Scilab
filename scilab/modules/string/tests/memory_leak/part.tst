// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Allan CORNET <allan.cornet@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//======================================
// test part
// memory leak
//======================================
clear;
FUNCTION_TO_TEST = "part";
NB_LOOPS = 1000000;
REF_4_1_2 = 0;
[BEFORE_FREE,BEFORE_TOTAL] = getmemory();

for i=1:NB_LOOPS
  c=part(['a','abc','abcd'],[1,1,2]);
  clear c;
end  

[AFTER_FREE,AFTER_TOTAL] = getmemory();
BEFORE_USED = BEFORE_TOTAL - BEFORE_FREE;
AFTER_USED = AFTER_TOTAL - AFTER_FREE;
if (abs(BEFORE_USED - AFTER_USED) > REF_4_1_2 ) then
  warning(FUNCTION_TO_TEST+" MEMORY LEAK : "+string(abs(BEFORE_USED - AFTER_USED))+ ' ko' );
end  
//======================================
