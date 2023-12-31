//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
file1 = TMPDIR+'/test1.bin';
file2 = TMPDIR+'/test2.bin';
fd1 = mopen(file1,'wb');
fd2 = mopen(file2,'wb');
mput(1996,'ull',fd1);
mput(1996,'ull',fd2);
mclose(fd1);
mclose(fd2);

fd1 = mopen(file1,'rb');
if 1996<>mget(1,'ull',fd1) then
    write(%io(2),'Bug');
end
fd2 = mopen(file2,'rb');
if 1996<>mget(1,'ull',fd2) then
    write(%io(2),'Bug');
end
mclose(fd1);
mclose(fd2);
  
fd1 = mopen(file1,'rb');
 
ierr = execstr('mget([1 2],''ull'',fd2)','errcatch');
if ierr <> 999 then pause,end
 
ierr = execstr('mget([1 2],''ull'',[fd2 fd2])','errcatch');
if ierr <> 999 then pause,end
 
ierr = execstr('mget(''rrrr'',''ull'',[fd2 fd2])','errcatch');
if ierr <> 999 then pause,end
 
ierr = execstr('mget(1,1,''fd2'')','errcatch');
if ierr <> 999 then pause,end
 
mclose(fd1);
 
ierr = execstr('mget(1,''ull'',0)','errcatch');
if ierr <> 999 then pause,end
ierr = execstr('mget(1,''ull'',6)','errcatch');
if ierr <> 999 then pause,end
