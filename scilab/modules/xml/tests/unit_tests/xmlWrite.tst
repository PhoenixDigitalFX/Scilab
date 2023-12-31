// ===========================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// ===========================================================================

// <-- CLI SHELL MODE -->

doc = xmlReadStr("<root><a att=""foo"" rib=""bar""><b>Hello</b></a></root>");
xmlWrite(doc, TMPDIR+"/foo.xml");

// Now we open the previous file, modify it and save it
doc1 = xmlRead(TMPDIR+"/foo.xml");
assert_checkequal(doc1.root.children.size,1);
assert_checkequal(doc1.root.children(1).name,"a");
assert_checkequal(doc1.root.children(1).attributes.att,"foo");
assert_checkequal(doc1.root.children(1).attributes.rib,"bar");
assert_checkequal(doc1.root.children(1).children(1).name,"b");
assert_checkequal(doc1.root.children(1).children(1).content,"Hello");
doc1.root.children(1).name = "newName";

xmlWrite(doc1);

assert_checkequal(doc1.root.children(1).name,"newName");
assert_checkequal(doc1.root.children(1).attributes.att,"foo");
assert_checkequal(doc1.root.children(1).attributes.rib,"bar");
assert_checkequal(doc1.root.children(1).children(1).name,"b");
assert_checkequal(doc1.root.children(1).children(1).content,"Hello");

// Now we check that the modification has been done
doc2 = xmlRead(TMPDIR+"/foo.xml");

assert_checkequal(doc2.root.children(1).name,"newName");
assert_checkequal(doc2.root.children(1).attributes.att,"foo");
assert_checkequal(doc2.root.children(1).attributes.rib,"bar");
assert_checkequal(doc2.root.children(1).children(1).name,"b");
assert_checkequal(doc2.root.children(1).children(1).content,"Hello");

xmlDelete("all");
