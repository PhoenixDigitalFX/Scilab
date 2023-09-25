// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - allan.cornet@inria.fr
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

cd('home');
mkdir('testdir');
cd('testdir');
r = mputl('Scilab can do it :p','files.txt');
if r <> %t then pause,end

cd('home');
res = ls('home/testdir');

if res <> 'files.txt' then pause,end

cd('home');
if removedir('testdir') <> %t then pause,end

cd('SCI');


