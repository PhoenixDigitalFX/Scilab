// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// Check that javahelp files are present and non-zero size for all supported languages

supportedLanguages = ["en_US" "fr_FR" "ja_JP" "pt_BR" "ru_RU"];

for kL=1:size(supportedLanguages, "*")
    helpFile = "SCI/modules/helptools/jar/scilab_" + supportedLanguages(kL) + "_help.jar";
    assert_checktrue(isfile(helpFile));
    [x, ierr] = fileinfo(helpFile);
    assert_checktrue(ierr==0);
    assert_checktrue(x(1) > 0);
end

