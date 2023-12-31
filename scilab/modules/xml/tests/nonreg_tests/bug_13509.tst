// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 13509 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13509
//
// <-- Short Description -->
// It was not possible to have an empty prefix with xmlNs
//

s = "<root><a/><b/></root>";
doc = xmlReadStr(s);
ns=xmlNs(doc.root,"","http://name.space");
xmlAddNs(doc.root.children(1),ns);
xmlAddNs(doc.root.children(2),ns);
out = xmlDump(doc);

assert_checkequal(out(3), "  <a xmlns:=""http://name.space""/>");

xmlDelete(doc)

s = "<root><a/><b/></root>";
doc = xmlReadStr(s);
ns=xmlNs(doc.root,[],"http://name.space");
xmlAddNs(doc.root.children(1),ns);
xmlAddNs(doc.root.children(2),ns);
out = xmlDump(doc);

assert_checkequal(out(3), "  <a xmlns=""http://name.space""/>");

xmlDelete(doc)
