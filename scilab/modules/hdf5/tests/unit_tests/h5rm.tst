// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - SCILAB ENTERPRISES - Simon GARESTE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->

msgerr = msprintf(gettext("%s: Wrong number of input argument(s): %d to %d expected.\n"),"h5rm", 1, 2);
assert_checkerror("h5rm()", msgerr, 77);
msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: string or H5Object expected.\n"), "h5rm", 1);
assert_checkerror("h5rm(42)", msgerr, 999);
msgerr = msprintf(gettext("%s: Wrong number of input arguments: %d expected.\n"),"h5rm", 2);
assert_checkerror("h5rm(""42"")", msgerr, 999);
msgerr = msprintf(gettext("%s: %s\n"), "h5rm", msprintf(gettext("Invalid hdf5 file: %s."), "42"));
assert_checkerror("h5rm(""42"",""42"")", msgerr, 999);


a = h5open(TMPDIR + "/test.h5", "a");
names = "Group_" + string(1:10);
h5group(a, names)
names = "Group_" + string(2:10);
h5rm(a,"Group_1");
assert_checkequal(a.root.Groups,gsort(names',"g",'i'));
halfnames = "Group_" + string(2:2:10);
oppositehalfnames = "Group_" + string(3:2:10);
h5rm(a,halfnames);
assert_checkequal(a.root.Groups,gsort(oppositehalfnames',"g",'i'));
msgerr = msprintf(gettext("%s: %s\n"), "h5rm", msprintf(gettext("The name doesn''t exist: %s."), "failingtest"));
assert_checkerror('h5rm(a,""failingtest"")', msgerr, 999);
msgerr = msprintf(gettext("%s: %s\n"), "h5rm", gettext("Cannot remove a file."));
assert_checkerror('h5rm(a)', msgerr, 999);
msgerr = msprintf(gettext("%s: %s\n"), "h5rm", gettext("Cannot remove root element."));
assert_checkerror('h5rm(a.root)', msgerr, 999);
msgerr = msprintf(gettext("%s: Wrong type for input argument #%d: string or H5Object expected.\n"), "h5rm", 1);
assert_checkerror('h5rm(a.root.Groups)', msgerr, 999);

h5write(a.root.Group_3, "Dset_1", [1 2 ; 3 4]);
h5ln(a, "Hard_Link", "/Group_3/Dset_1", %t);
h5rm(a,"Hard_Link");
msgerr = msprintf(gettext("%s: Error in retrieving field content:\n%s\n"), "%H5Object_e", msprintf(gettext("Invalid field: %s"), "Hard_Link"));
assert_checkerror('a.root.Hard_Link', msgerr, 999);
h5rm(a,"/Group_3/Dset_1");
msgerr = msprintf(gettext("%s: Error in retrieving field content:\n%s\n"), "%H5Object_e", msprintf(gettext("Invalid field: %s"), "Dset_1"));
assert_checkerror('a.root.Group_3.Dset_1', msgerr, 999);

h5ln(a,"Soft_Link",".Group_1/Dset_1");
msgerr = msprintf(gettext("%s: Error in retrieving field content:\n%s\n"), "%H5Object_e", msprintf(gettext("Invalid field: %s"), "Soft_Link"));
assert_checkerror('h5rm(a,a.root.Soft_Link)', msgerr, 999);
h5rm(a,a.root.Softs);
assert_checkequal(a.root.Softs,[]);
h5write(a.root.Group_3, "Dset_1", [1 2 ; 3 4]);
h5ln(a,"Soft_Link",".Group_3/Dset_1");

h5close(a);
