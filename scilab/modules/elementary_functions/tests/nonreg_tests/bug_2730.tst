// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

ref = ["aaaaaaaaa","aaaaacccc";"aaaaaaaaaaaaaaab","aaaabbbbccc"];
A = [ "aaaabbbbccc" "aaaaaaaaa" ; "aaaaacccc" "aaaaaaaaaaaaaaab" ];
B = gsort(A,'g','i');
if (ref<>B) then pause,end;
// =============================================================================
