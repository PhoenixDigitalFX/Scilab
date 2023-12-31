// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13435 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13435
//
// <-- Short Description -->
// Crash under Windows when xmlRemove on the first child
//

doc = xmlReadStr("<root><a>Hello</a><b>Scilab</b><a>World</a></root>");
c = doc.root.children;
assert_checkequal(3, c.size);
xmlRemove(doc.root.children(1));
assert_checkequal(2, c.size);

xmlDelete(doc)
