// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// =============================================================================
// Tests fullfile
// =============================================================================
//
assert_checkequal(fullfile([]), []);
assert_checkequal(fullfile([],[]), []);
assert_checkequal(fullfile([],[],[]), []);

msgerr = msprintf(gettext("%s: Wrong number of input argument(s): At least %d expected.\n"), "fullfile", 1);
assert_checkerror ("fullfile()" , msgerr);

REF = SCI + '/etc/scilab.start';
r = fullfile(SCI, '/etc/', 'scilab.start');

if getos() <> "Windows" then
  REF1 =  "/home/scilab/macros/util/fullfile.sci";
  REF2 =  "/cygdrive/C/scilab/macros/util/fullfile.sci";
else
  REF1 =  "\home\scilab\macros\util\fullfile.sci";
  REF2 =  "C:\scilab\macros\util\fullfile.sci";
end

r1 = fullfile("/home/", "\scilab", "macros", "\util", "fullfile.sci");
r2 = fullfile("C:", "\scilab", "macros", "\util", "fullfile.sci");
assert_checkequal(r1, REF1);
assert_checkequal(r2, REF2);

msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: a string expected.\n"), "fullfile", 2);
assert_checkerror ("r = fullfile(SCI, 3, ''scilab.start'')", msgerr);

if getos() <> "Windows" then
  REF = ['/home/scilab/macros/util/fullfile.sci';
         '/home/scilab/macros/util/toto.sci'];
else
  REF = ['\home\scilab\macros\util\fullfile.sci';
         '\home\scilab\macros\util\toto.sci'];
end

r = fullfile("/home/","\scilab","macros","\util", ["fullfile.sci"; "toto.sci"]);
assert_checkequal(r, REF);

// Final filesep:  https://gitlab.com/scilab/scilab/-/issues/16624
// -------------
assert_checkequal(part(fullfile(TMPDIR, "mylib"),$-1:$), "ib");
assert_checkequal(part(fullfile(TMPDIR, "mylib/"),$-1:$), "b"+filesep());
assert_checkequal(part(fullfile(TMPDIR, "mylib\"),$-1:$), "b"+filesep());
r = fullfile(TMPDIR, ["mylib" "mylib/" "mylib\"]);
assert_checkequal(part(r,$-1:$), ["ib" ["b" "b"]+filesep()]);
r = fullfile(TMPDIR, ["mylib" "mylib/" "mylib\"]');
assert_checkequal(part(r,$-1:$), ["ib" ["b" "b"]+filesep()]');
