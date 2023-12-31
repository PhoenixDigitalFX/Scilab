//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================


tab_ref = [
"азеазея",
"เฮลโลเวิลด์",
"حريات وحقوق",
"תוכנית"];


for i = 1:size(tab_ref, "*");
    targetFile = TMPDIR + filesep() + "README_" + tab_ref(i);
    myFile = http_get("http://ftp.lip6.fr/pub/linux/distributions/debian/README", targetFile);
    assert_checkequal(targetFile, myFile);
    assert_checkequal(isfile(targetFile), %t);
end
