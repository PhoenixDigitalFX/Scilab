// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 232 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/232
//
// <-- Short Description -->
//   Ces deux groupes de trois lignes font quasiment la meme chose. Dans le premier cas, la fenetre est correctement reajustee et dans le second un truc affreux est fait alors qu'il ne faut rien faire!!!

// <-- TEST WITH GRAPHIC -->

clf();                       
plot2d([.4; .6],[-.6 ;.6],-3);
plot2d(.2,0,-3) 
               
clf(); 
plot2d([.4; .6],[-.6;.6],-3);
plot2d(.5,0,-3);

