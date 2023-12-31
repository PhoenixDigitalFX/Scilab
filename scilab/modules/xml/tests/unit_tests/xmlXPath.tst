// ===========================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// ===========================================================================

// <-- CLI SHELL MODE -->

xmlFile=xmlRead(SCI+"/modules/xml/tests/unit_tests/w3cExample.xml");
titles=xmlXPath(xmlFile, "/bookstore/book/title");
assert_checkequal(titles.size,5);
assert_checkequal(titles(4).name,"title");
assert_checkequal(titles(4).content,"Learning XML");
assert_checkequal(titles(4).type,"XML_ELEMENT_NODE");
assert_checkequal(titles(5).name,"title");
assert_checkequal(titles(5).content,"Scilab rox");
assert_checkequal(titles(5).type,"XML_ELEMENT_NODE");
attribs=titles(4).attributes;
assert_checkequal(titles(4).attributes.size,[]);
assert_checkequal(attribs.lang,"en");

// Get all the books where the price is more than 35 euros
moreThan35eList=xmlXPath(xmlFile,"/bookstore/book[price>35]/title");
assert_checkequal(moreThan35eList.size,2);
assert_checkequal(size(moreThan35eList),[1,2]);
assert_checkequal(moreThan35eList(1).content,"XQuery Kick Start");
assert_checkequal(moreThan35eList(2).content,"Learning XML");

// Get all the free books
freeBooks=xmlXPath(xmlFile,"/bookstore/book[price=0]/title");
assert_checkequal(freeBooks.size,1);
assert_checkequal(size(freeBooks),[1,1]);
assert_checkequal(freeBooks(1).content,"Scilab rox");

xmlDelete(xmlFile);

xmlFile=xmlRead(SCI+"/modules/xml/tests/unit_tests/sep_69_example.xml");
titles=xmlXPath(xmlFile, "/root/hello");
assert_checkequal(titles.size,2);
xmlDelete(xmlFile);

xmlFile=xmlRead(SCI+"/etc/modules.xml");
content=xmlDump(xmlFile);
assert_checktrue(length(content)>0);
assert_checktrue(size(content)>=[1,1]);
xmlDelete(xmlFile);
// Delete the file a second time
msgerr = msprintf(gettext("%s: XML document does not exist.\n"), "xmlDelete");
assert_checkerror("xmlDelete(xmlFile)", msgerr);

xmlFile=xmlRead(SCI+"/etc/modules.xml");
xmlFile2=xmlRead(SCI+"/etc/classpath.xml");
content=xmlDump(xmlFile);
content2=xmlDump(xmlFile2);
//assert_checkequal(content, content2);
assert_checktrue(length(content)>0);
assert_checktrue(size(content)>=[1,1]);
assert_checktrue(length(content2)>0);
assert_checktrue(size(content2)>=[1,1]);
xmlDelete(xmlFile);
xmlDelete(xmlFile2);
// Delete the file a second time
msgerr = msprintf(gettext("%s: XML document does not exist.\n"), "xmlDelete");
assert_checkerror("xmlDelete(xmlFile)", msgerr);


xmlFile=xmlRead(SCI+"/modules/xml/tests/unit_tests/w3cExample.xml");
titles=xmlXPath(xmlFile, "/bookstore/book/title");
assert_checkequal(titles.name,["title","title","title","title","title"]);
assert_checkequal(titles.content,["Everyday Italian","Harry Potter","XQuery Kick Start","Learning XML","Scilab rox"]);

prices=xmlXPath(xmlFile, "/bookstore/book/price");
assert_checkequal(prices.name,["price","price","price","price","price"]);
assert_checkequal(prices.content,["30.00","29.99","49.99","39.95","0.0"]);

titlesEmpty=xmlXPath(xmlFile, "/bookstore/book/prices");
assert_checkequal(length(titlesEmpty),0);

xmlDelete(xmlFile);

xmlFile=xmlRead(SCI+"/modules/xml/tests/unit_tests/w3cExample.xml");
titles=xmlXPath(xmlFile, "/bookstore");
results=xmlXPath(titles(1), "book[title=''Everyday Italian'']");
assert_checkequal(length(results),1);
assert_checkequal(results.name,"book");
assert_checkequal(results.content,"Everyday ItalianGiada De Laurentiis200530.00");
assert_checkequal(results(1).children(1).content,"Everyday Italian");
xmlDelete(xmlFile);

doc = xmlReadStr("<root att=""attribute""><a a1=""A1"" a2=""A2"" a3=""A3""><b>Hello</b><c>Scilab</c><b>World</b></a><b>Nothing</b></root>");

e = doc.root.children(1);
assert_checkequal(e.content,"HelloScilabWorld");
assert_checkequal(e.name,"a");

xp = xmlXPath(e, "@*");
assert_checkequal(["A1","A2","A3"],xmlAsText(xp));

xp = xmlXPath(e, "b");
assert_checkequal(["Hello","World"],xmlAsText(xp));

xmlDelete(doc);
