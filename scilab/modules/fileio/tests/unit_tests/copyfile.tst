// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Bruno JOFRET <bruno.jofret@inria.fr>
// Copyright (C) 2007-2008 - INRIA - Allan CORNET
// Copyright (C) 2009 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- ENGLISH IMPOSED -->

// =============================================================================
// Date   : 13/12/2007
//
// Unitary tests for copyfile function
// =============================================================================
// TEST 1 : copyfile
tab_ref = [
"世界您好",
"азеазея",
"ハロー・ワールド",
"เฮลโลเวิลด์",
"حريات وحقوق",
"프로그램",
"프로그램",
"תוכנית"];
cd TMPDIR;
mkdir test_copyfile_source;
mkdir test_copyfile_target;
cd('test_copyfile_source');

for i = 1 : size(tab_ref,"*")
	filename = tab_ref(i) + '.orig';
	mputl('I am a dummy String : ' + tab_ref(i), filename);
	if fileinfo(filename) == [] then pause,end
end

for i = 1 : size(tab_ref,"*")
	orig = tab_ref(i) + '.orig';
	dest = tab_ref(i) + '.dest';
	r = copyfile(TMPDIR+'/test_copyfile_source/' + orig, TMPDIR+'/test_copyfile_target/' + dest);
	if r <> 1 then pause,end
	if fileinfo(TMPDIR+'/test_copyfile_target/' + dest) == [] then pause,end
end

cd TMPDIR;
rmdir('test_copyfile_source', 's');
rmdir('test_copyfile_target', 's');
// =============================================================================
cd TMPDIR;
dir1="test dir with space";
dir2="test dir with space number 2";
file1='dummyFile.dummy';
mkdir(dir1);
mkdir(dir2);

mputl('I am a dummy String', dir1+'/'+file1);
copyfile(dir1+'/'+file1,dir2);

lsResult = ls(dir2+'/'+file1);
if lsResult == [] then pause,end
// =============================================================================
removedir(TMPDIR+'/etc');
ierr = execstr("copyfile(SCI+""etc"",TMPDIR)","errcatch");
if ierr <> 999 then pause,end
// =============================================================================
ref_files = ['fileio.start','fileio.quit'];
// =============================================================================
// copy a directory into a directory
a = copyfile(SCI+'/modules/fileio/etc',TMPDIR);
if (a <> 1) then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(1)) == [] then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(2)) == [] then pause,end
mdelete(TMPDIR + filesep() + ref_files(1));
mdelete(TMPDIR + filesep() + ref_files(2));
// =============================================================================
// copy a directory into a directory  with separator(s)
a = copyfile(SCI+'/modules/fileio/etc',TMPDIR + filesep());
if (a <> 1) then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(1)) == [] then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(2)) == [] then pause,end
mdelete(TMPDIR + filesep() + ref_files(1));
mdelete(TMPDIR + filesep() + ref_files(2));
// =============================================================================
// copy a directory into a directory  with separator(s)
a = copyfile(SCI+'/modules/fileio/etc' + filesep(), TMPDIR);
if (a <> 1) then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(1)) == [] then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(2)) == [] then pause,end
mdelete(TMPDIR + filesep() + ref_files(1));
mdelete(TMPDIR + filesep() + ref_files(2));
// =============================================================================
// copy a directory into a directory  with separator(s)
a = copyfile(SCI+'/modules/fileio/etc' + filesep(), TMPDIR  + filesep());
if (a <> 1) then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(1)) == [] then pause,end
if fileinfo(TMPDIR + filesep() + ref_files(2)) == [] then pause,end
mdelete(TMPDIR + filesep() + ref_files(1));
mdelete(TMPDIR + filesep() + ref_files(2));
// =============================================================================
// copy a file to a file
mdelete(TMPDIR + '/scilab.start');
a = copyfile(SCI+'/etc/scilab.start', TMPDIR + '/scilab.start');
if fileinfo(TMPDIR + '/scilab.start') == [] then pause,end
mdelete(TMPDIR + '/scilab.start');
// =============================================================================
// copy a file into a directory
mdelete(TMPDIR + '/scilab.quit');
a = copyfile(SCI+'/etc/scilab.quit', TMPDIR);
if fileinfo(TMPDIR + '/scilab.quit') == [] then pause,end
mdelete(TMPDIR + '/scilab.quit');
// =============================================================================
// copy a file into a directory with separator
mdelete(TMPDIR + '/modules.xml');
a = copyfile(SCI+'/etc/modules.xml', TMPDIR + filesep());
if fileinfo(TMPDIR + '/modules.xml') == [] then pause,end
mdelete(TMPDIR + '/modules.xml');
// =============================================================================
// copy directory with sub-directories
mkdir(TMPDIR + '/copyfile_test');
a = copyfile(SCI+'/modules/fileio/tests', TMPDIR + filesep() + 'copyfile_test');
if (a <> 1) then pause,end
if fileinfo(TMPDIR + '/copyfile_test/unit_tests/copyfile.tst') == [] then pause,end
rmdir(TMPDIR + '/copyfile_test');
// =============================================================================
