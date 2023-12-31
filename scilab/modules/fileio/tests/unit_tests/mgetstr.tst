// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

NB_CHARS = 43;
REF_NB_CHARS = 1478;
textfile = 'SCI/modules/fileio/tests/unit_tests/text.txt';

ierr = execstr('mgetstr(NB_CHARS,textfile)','errcatch');
if ierr <> 999 then pause,end

ierr = execstr('mgetstr()','errcatch');
if ierr <> 77 then pause,end

ierr = execstr('mgetstr(NB_CHARS,textfile,1)','errcatch');
if ierr <> 77 then pause,end


fd = mopen(textfile,'r');
str = mgetstr(NB_CHARS,fd);
mclose(fd);
ref1 = 'Scilab is a numerical computational package';
if length(str) <> NB_CHARS then pause,end
if str <> ref1 then pause,end;


fd = mopen(textfile,'r');
str = mgetstr(NB_CHARS*2,fd);
mclose(fd);

fd = mopen(textfile,'rb');
str2 = ascii(mget(NB_CHARS*2,'c',fd));
mclose(fd);

if str <> str2 then pause,end

fd = mopen(textfile,'rt');
str = mgetstr(1000000,fd);
mclose(fd);
if length(str) <> REF_NB_CHARS then pause,end


fd = mopen(textfile,'rt');
str = mgetstr(REF_NB_CHARS,fd);
mclose(fd);
if length(str) <> REF_NB_CHARS then pause,end

ierr = execstr('mgetstr(REF_NB_CHARS,0)','errcatch');
if ierr <> 999 then pause,end
ierr = execstr('mgetstr(REF_NB_CHARS,6)','errcatch');
if ierr <> 999 then pause,end
