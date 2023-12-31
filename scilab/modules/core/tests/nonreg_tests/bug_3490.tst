// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3490 -->
//
// <-- CLI SHELL MODE -->
// <-- NOT FIXED --> 6.0.0
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3490
//
// <-- Short Description -->
// "resume" inside an exec crashes Scilab + "resume" restriction of use removed


mputl("[a,b] = resume(1,2);b=3",TMPDIR+"/foo.sce");
exec(TMPDIR+"/foo.sce",-1)
if a<>1|b<>2 then pause,end

clear a b
mputl("for k=1:2,if k==1 then [a,b] = resume(1,2);end;end,b=3",TMPDIR+"/foo.sce");
exec(TMPDIR+"/foo.sce",-1)
if a<>1|b<>2 then pause,end


clear a  b
mputl("execstr(""[a,b] = resume(1,2);b=3"")",TMPDIR+"/foo.sce");
exec(TMPDIR+"/foo.sce",-1)
if a<>1|b<>2 then pause,end

clear a  b
mputl("for k=1:2,if k==1 then execstr(""[a,b] = resume(1,2)"");end;end;b=3",TMPDIR+"/foo.sce");
exec(TMPDIR+"/foo.sce",-1)
if a<>1|b<>2 then pause,end


clear a  b
execstr("execstr(""[a,b] = resume(1.1,2.2);b=3"")")
if a<>1.1|b<>2.2 then pause,end

deff("y=foo()",[
"  y=0;"
"  execstr(""[aa,bb] = resume(1.1,2.2)"");"
"  y=3;"],"n")
if foo()<>0 then pause,end
if aa<>1.1|bb<>2.2 then pause,end

clear aa bb foo
deff("y=foo()",[
"  y=0;"
"  execstr(""[aa,bb] = resume(1.1,2.2)"");"
"  y=3;"])
if foo()<>0 then pause,end
if aa<>1.1|bb<>2.2 then pause,end

clear aa bb foo
deff("y=foo()",[
"  y=0;"
"  for k=1:2"
"    if k==1 then"
"       execstr(""[aa,bb] = resume(1.1,2.2)"");"
"    end"
"  end"
"  y=3;"])
if foo()<>0 then pause,end
if aa<>1.1|bb<>2.2 then pause,end




clear aa bb foo
deff("y=foo()",[
"  y=0;"
"  [aa,bb] = resume(1.1,2.2);"
"  y=3;"],"n")
if foo()<>0 then pause,end
if aa<>1.1|bb<>2.2 then pause,end

clear aa bb foo
deff("y=foo()",[
"  y=0;"
"  for k=1:2"
"    if k==1 then"
"      [aa,bb] = resume(1.1,2.2);"
"    end"
"  end"
"  y=3;"],"n")
if foo()<>0 then pause,end
if aa<>1.1|bb<>2.2 then pause,end



clear aa bb foo
deff("y=foo()",[
"  y=0;"
"  [aa,bb] = resume(1.1,2.2);"
"  y=3;"])
if foo()<>0 then pause,end
if aa<>1.1|bb<>2.2 then pause,end

clear aa bb foo y
deff("y=foo()",[
"  y=0;"
"  execstr(""[aa,bb] = resume(1.1,2.2)"");"
"  y=3;"],"n")
exec(foo,-1)
if y<>0|aa<>1.1|bb<>2.2 then pause,end


clear aa bb foo y
deff("y=foo()",[
"  y=0;"
"  execstr(""[aa,bb] = resume(1.1,2.2)"");"
"  y=3;"])
exec(foo,-1)
if y<>0|aa<>1.1|bb<>2.2 then pause,end


clear aa bb foo y
deff("y=foo()",[
"  y=0;"
"  for k=1:2"
"    if k==1 then"
"       execstr(""[aa,bb] = resume(1.1,2.2)"");"
"    end"
"  end"
"  y=3;"])
exec(foo,-1);
if y<>0|aa<>1.1|bb<>2.2 then pause,end

