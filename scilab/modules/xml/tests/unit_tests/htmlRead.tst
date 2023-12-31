// ===========================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// ===========================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

doc = htmlRead(SCI + "/modules/helptools/data/pages/homepage-en_US.html");
xp = xmlXPath(doc,"//a/@href");
assert_checktrue(xp.size > 0);
links = xmlAsText(xp);
assert_checktrue(or(links=="https://www.scilab.org/"));
htmlWrite(doc, TMPDIR + "/foo.html");
xmlDelete(doc);
doc = htmlRead(TMPDIR + "/foo.html");
xp = xmlXPath(doc,"//a/@href");
assert_checktrue(xp.size > 0);
links2 = xmlAsText(xp);
assert_checkequal(links, links2);
xmlDelete(doc);
