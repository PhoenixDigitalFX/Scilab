// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 1998-2010 - INRIA - Serge Steer
// This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

clear foo
deff("foo()","a=1,b=2,c=3;[x,y]=resume(a,b)")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;[x,y,z]=resume(a,b,c)")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;[x,y]=resume(a,b);end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;[x,y,z]=resume(a,b,c);end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;[x,y]=resume(a,b);end;end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;[x,y,z]=resume(a,b,c);end;end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;[x,y]=resume(a,b)")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;[x,y,z]=resume(a,b,c)")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;[x,y]=resume(a,b);end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;[x,y,z]=resume(a,b,c);end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;[x,y]=resume(a,b);end;end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;[x,y,z]=resume(a,b,c);end;end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;execstr(""[x,y]=resume(a,b)"")")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;execstr(""[x,y,z]=resume(a,b,c)"")")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;execstr(""[x,y]=resume(a,b)"");end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;execstr(""[x,y,z]=resume(a,b,c)"");end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;execstr(""[x,y]=resume(a,b)"");end;end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;execstr(""[x,y,z]=resume(a,b,c)"");end;end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;execstr(""[x,y]=resume(a,b)"")")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","a=1,b=2,c=3;execstr(""[x,y,z]=resume(a,b,c)"")")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z
deff("foo()","if %t then a=1,b=2,c=3;execstr(""[x,y]=resume(a,b)"");end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","if %t then a=1,b=2,c=3;execstr(""[x,y,z]=resume(a,b,c)"");end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;execstr(""[x,y]=resume(a,b)"");end;end")
foo(); if x<>1|y<>2 then pause,end
clear foo x y z

deff("foo()","for k=1:3,if k==3 then a=1,b=2,c=3;execstr(""[x,y,z]=resume(a,b,c)"");end;end")
foo(); if x<>1|y<>2|z<>3 then pause,end
clear foo x y z

// Nested functions
// =============================================================================
clear  foo1  foo2  foo3
function foo1()
	clear var_a var_b var_c var_d;
	foo2()
	[va,vb,vc,vd] = resume(var_a,var_b,var_c,var_d);
endfunction

function foo2()
	clear variable_a variable_b variable_c variable_d;
	foo3()
	[var_a,var_b,var_c,var_d] = resume(variable_a,variable_b,variable_c,variable_d);
endfunction

function foo3()
	a = [ 1 2 ; 3 4 ];
	b = [ "un" "deux" ; "trois" "quatre" ];
	c = [ %T %F ; %T %T ];
	d = struct();
	d("field1") = a;
	d("field2") = b;
	d("field3") = c;
	[variable_a,variable_b,variable_c,variable_d] = resume(a,b,c,d);
endfunction

clear ref_a ref_b ref_c

ref_a = [ 1 2 ; 3 4 ];
ref_b = [ "un" "deux" ; "trois" "quatre" ];
ref_c = [ %T %F ; %T %T ];
ref_d = struct();
ref_d("field1") = ref_a;
ref_d("field2") = ref_b;
ref_d("field3") = ref_c;
clear va vb vc vd;

foo1()
if or( va <> ref_a ) then pause, end
if or( vb <> ref_b ) then pause, end
if or( vc <> ref_c ) then pause, end
if or( vd <> ref_d ) then pause, end
clear va vb vc vd;

err = execstr("foo1()","errcatch");
if err<>0 then pause, end
if or( va <> ref_a ) then pause, end
if or( vb <> ref_b ) then pause, end
if or( vc <> ref_c ) then pause, end
if or( vd <> ref_d ) then pause, end
clear va vb vc vd;

clear foo1 foo2 foo3 ref_a ref_b ref_c ref_d;
