// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 12613 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12613
//
// <-- Short Description -->
// gsort does not return correct results with %nan

a=[7.3823825;6.1668939;5.9115362;15.372423;10.582661;9.8383509;7.8413325;8.8230863;%nan;%nan;%nan;%nan];
a_ref=[5.9115362;6.1668939;7.3823825;7.8413325;8.8230863;9.8383509;10.582661;15.372423;%nan;%nan;%nan;%nan];
assert_checkequal(gsort(a,'lr','i'), a_ref);

a=[7.3823825, 6.1668939,5.9115362,15.372423,10.582661,9.8383509,7.8413325,8.8230863,%nan,%nan,%nan,%nan];
assert_checkequal(gsort(a,'lc','i'),a_ref');
