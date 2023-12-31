//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Vincent LEJEUNE
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// Check failure case
if ( execstr('ilib_include_flag(3)','errcatch') == 0 ) then pause, end

// not a dir, should fail

if ( execstr('ilib_include_flag(/usr/include/stdlib.h)','errcatch')  == 0 ) then pause, end

 // should not exist, should fail
if ( execstr('ilib_include_flag(/usr/my_exotic_dir/);','errcatch')  == 0 ) then pause, end

cd TMPDIR;
mkdir("myincludespath");

if getos() == "Windows" then
    ref_flag = " -I""" + WSCI + "/bin"" " + "-I""" + WSCI + "/modules"" -I""" + fullpath(TMPDIR) + filesep() + "myincludespath""";
    ref_flag = strsubst(ref_flag, "/", filesep());
    includes_path = [ "bin" , "modules" , TMPDIR + filesep() + "myincludespath"];
else
    ScilabTreeFound = %F;

    // Source version
    if isdir(SCI + "/bin") then
        ref_flag = " -I" + SCI + "/bin " + "-I" + SCI + "/modules -I" + fullpath(TMPDIR) + filesep() + "myincludespath";
        includes_path = [ "bin" , "modules" , TMPDIR + filesep() + "myincludespath"];
        ScilabTreeFound = %T;
    end

    // Binary version
    if isdir(SCI+"/../../include/scilab/") & ~ScilabTreeFound then
        ref_flag = " -I" + fullpath(SCI + "/../../bin") + " " + "-I" + SCI + "/modules -I" + fullpath(TMPDIR) + filesep() + "myincludespath";
        includes_path = [ "../../bin" , "modules" , TMPDIR + filesep() + "myincludespath"];
        ScilabTreeFound = %T;
    end

    // System version (ie: /usr/include/scilab/)
    if isdir("/usr/include/scilab/") & ~ScilabTreeFound then
        ref_flag = " -I/usr/bin " + "-I" + SCI + "/modules -I" + fullpath(TMPDIR) + filesep() + "myincludespath";
        includes_path = [ "/usr/bin" , "modules" , TMPDIR + filesep() + "myincludespath"];
        ScilabTreeFound = %T;
    end

    assert_checktrue(ScilabTreeFound);

end

cd SCI;
output_flag = ilib_include_flag(includes_path);

assert_checkequal(output_flag, ref_flag);
