//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Sylvestre LEDRU <sylvestre.ledru@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//===============================
// unit tests getlanguage
//===============================

// Switch to french with small code
lang="fr"; setlanguage(lang); if getlanguage() <> "fr_FR" then pause, end

// Switch to english with small code
lang="en"; setlanguage(lang); if getlanguage() <> "en_US" then pause, end

// Switch to english with full code
lang="en_US"; setlanguage(lang); if getlanguage() <> "en_US" then pause, end

// Switch to french with full code
lang="fr_FR"; setlanguage(lang); if getlanguage() <> "fr_FR" then pause, end

