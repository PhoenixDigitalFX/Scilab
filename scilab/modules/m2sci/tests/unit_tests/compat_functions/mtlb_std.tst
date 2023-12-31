// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

X = [1 5 9; 7 15 22];

assert_checkalmostequal(mtlb_std(X), 7.547626558506);

assert_checkalmostequal(mtlb_std(X, 0), 7.547626558506);
assert_checkalmostequal(mtlb_std(X, 1), 6.890008869531);

assert_checkalmostequal(mtlb_std(X, 0, 1), [4.242640687119 7.071067811865 9.192388155425]);
assert_checkalmostequal(mtlb_std(X, 0, 2), [4 ; 7.505553499465]);

assert_checkalmostequal(mtlb_std(X, 1, 1), [3 5 6.5]);
assert_checkalmostequal(mtlb_std(X, 1, 2), [3.265986323711 ; 6.128258770283]);
