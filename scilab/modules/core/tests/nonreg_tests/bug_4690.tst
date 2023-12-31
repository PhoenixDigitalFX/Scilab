// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4690 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4690
//
// <-- Short Description -->
// 
// The number of external function that one can load in scilab is fixed to 1536
 
[f,c] = what();
nb_functions = size(f,'*');
funid = funptr('msprintf');
funnames = [];
// We add 10000 functions
nb_added_functions = 10000;
for i=1:nb_added_functions
  funname = 'msprintf' + string(i);
  funnames = [funnames, funname];
  newfun(funname, funid);  
end

[f,c] = what();
new_nb_functions = size(f,'*');
if (new_nb_functions - nb_functions) <> nb_added_functions then pause,end

for i=1:nb_added_functions
  r = [];
  ierr = execstr('r = msprintf' + string(i) + '(''OK'')','errcatch');
  if ierr <> 0 then pause,end
  if r <> 'OK' then pause,end
end

for i=1:nb_added_functions
  ierr = execstr('clearfun(''msprintf' + string(i) + ''');','errcatch');
  if ierr <> 0 then pause,end
end
