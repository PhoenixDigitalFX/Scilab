// ===========================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Sylvestre LEDRU
//
//  This file is distributed under the same license as the Scilab package.
// ===========================================================================

// <-- CLI SHELL MODE -->

doc = xmlReadStr("<root><a att=""foo"" rib=""bar""><b>Hello</b></a></root>");
// An error

// Now we define %s_xmlFormat to handle double type
// Take care, in this example, the double matrix is not handled
function y=%s_xmlFormat(x), y="<number>" + string(x) + "</number>", endfunction;

// we retry a number insertion
doc.root.children(1.5) = 1.23456;
xmlDump(doc);
assert_checkequal(doc.root.children(2).content,"1.23456");
assert_checkequal(evstr(doc.root.children(2).content),1.23456);
doc.root.children(1.5) = "plop";
assert_checkequal(doc.root.children(2).content,"plop");
assert_checkequal(doc.root.children(3).content,"1.23456");
assert_checkequal(evstr(doc.root.children(3).content),1.23456);
xmlDelete(doc);
