// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Calixte Denizet Charlotte Hecquet
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// 4 triangles
m = [6 5 4; ...
           6 2 5; ...
           6 4 1; ...
           5 2 3];
          
nodes = [55  20; ...
          85  5; ...
          100 10; ...
          75  30; ...
          80  20; ...
          70  15];
z = [-1 -1 0.0001 0.0001 1 1];

// contours
xc_ref = [-0.5, 64.999, 58.75, -0.5, 81.25, 83.75, 92.49925, 0, 74.998, 62.5, 0, 77.5, 82.5, 99.9985, ...
          0.5, 77.49975, 72.50025, 66.25, 0.5, 73.75, 81.25, 90.001];
yc_ref = [2, 24.9995, 18.75, 3, 7.5, 8.75, 7.49975, 2, 29.999, 17.5, 3, 10, 12.5, 9.9995, ...
          3, 25.0005, 22.50075, 16.25, 3, 12.5, 16.25, 14.9995];
[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))', m, (1:size(m, 1))'], z, [-0.5, 0, 0.5]);
assert_checkalmostequal(xc, xc_ref);
assert_checkalmostequal(yc, yc_ref);
[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))', m, (1:size(m, 1))'], z, 3);
assert_checkalmostequal(xc, xc_ref);
assert_checkalmostequal(yc, yc_ref);

// 2 quadrangles
m = [1 2 3 4; 4 3 6 5];
          
nodes = [10 20; ...
          40 20; ...
          50 40; ...
          5 40; ...
          20 80; ...
          40 80];
z = [-1 -1 0 0 1 1];

// contours
[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))', m, (1:size(m, 1))'], z, [-0.5, -0.25, 0, 0.25, 0.5]);
xc_ref = [-0.5,45,30,7.5,-0.25,47.5,40,6.25,0,50,5,0.25,47.5,13.75,8.75,0.5,45,22.5,12.5];
yc_ref = [3,30,30,30,3,35,35,35,2,40,40,3,50,50,50,3,60,60,60];
assert_checkequal(xc, xc_ref);
assert_checkequal(yc, yc_ref);
[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))', m, (1:size(m, 1))'], z, [-0.6 -0.2 0.2 0.6]);
xc_ref = [-0.6,44,26,8,-0.2,48,42,6,0.2,48,12,8,0.6,44,26,14];
yc_ref = [3,28,28,28,3,36,36,36,3,48,48,48,3,64,64,64];
assert_checkequal(xc, xc_ref);
assert_checkequal(yc, yc_ref);
[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))', m, (1:size(m, 1))'], z, 4);
assert_checkalmostequal(xc, xc_ref);
assert_checkalmostequal(yc, yc_ref);


// Error messages
// Number of arguments
err = msprintf(_("%s: Wrong number of input argument(s): %d expected.\n"), "contour2dm", 5);
assert_checkerror("[xc,yc] = contour2dm()", err);
assert_checkerror("[xc,yc] = contour2dm(""A"", nodes(:,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5], ""arg6"")", err);
err = msprintf(_("%s: Wrong number of output argument(s): %d expected.\n"), "contour2dm", 2);
assert_checkerror("contour2dm(""A"", nodes(:,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5])", err);
assert_checkerror("[xc,yc,zc] = contour2dm(""A"", nodes(:,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5])", err);

// Type of arguments
err = msprintf(_("%s: Wrong type for argument #%d: A real expected.\n"), "contour2dm", 1);
assert_checkerror("[xc,yc] = contour2dm(""A"", nodes(:,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5])", err);
err = msprintf(_("%s: Wrong type for argument #%d: A real expected.\n"), "contour2dm", 2);
assert_checkerror("[xc,yc] = contour2dm(nodes(:,1), ""A"", [(1:size(m, 1))'', m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5])", err);
err = msprintf(_("%s: Wrong type for argument #%d: A real expected.\n"), "contour2dm", 3);
assert_checkerror("[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), ""A"", z, [-0.5, -0.25, 0, 0.25, 0.5])", err);
err = msprintf(_("%s: Wrong type for argument #%d: A real expected.\n"), "contour2dm", 4);
assert_checkerror("[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], ""A"", [-0.5, -0.25, 0, 0.25, 0.5])", err);
err = msprintf(_("%s: Wrong type for argument #%d: A real expected.\n"), "contour2dm", 5);
assert_checkerror("[xc, yc] = contour2dm(nodes(:,1), nodes(:,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], z, ""A"")", err);


// Size of arguments
err = msprintf(_("%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n"), "contour2dm", 2, 6, 1);
assert_checkerror("[xc,yc] = contour2dm(nodes(:,1), nodes(1,2), [(1:size(m, 1))'', m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5])", err);
err = msprintf(_("%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n"), "contour2dm", 2, 1, 1);
assert_checkerror("[xc, yc] = contour2dm(nodes(1,1), nodes(:,2), [m, (1:size(m, 1))''], z, [-0.5, -0.25, 0, 0.25, 0.5])", err);

