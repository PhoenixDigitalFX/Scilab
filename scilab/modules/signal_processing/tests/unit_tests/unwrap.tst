// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Samuel Gougeon
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->

// Example #1 (1D wrapped)
t = linspace(-4, 4.2, 800);
Y = t.^2 + t -1;
Yw = atan(tan(Y));  // Raw wrapped recovered Y [pi]
Yunw = unwrap(Yw, %pi);
assert_checkequal(size(Yunw), size(Y));
assert_checkalmostequal(max(Yunw), 8.273629385640850486539, [], 1e-12);
assert_checkalmostequal(min(Yunw), -13.816370473381940797708, [], 1e-12);

// Example #2 (1D wrapped)
rand("seed", 0);
c = (rand(1, 1)-0.5)*4;
Yw = pmodulo(Y, 5) + c;  // unwrap() is unsensitive to a constant and even to a trend
[Yunw, K] = unwrap(Yw, 0);
assert_checkequal(size(Yunw), size(Y));
assert_checkalmostequal(max(Yunw), 9.6852994618564913764658, [], 1e-12);
assert_checkalmostequal(min(Yunw), -12.404700397166287473283, [], 1e-12);
assert_checkequal(K, [15 98 233 450 585 668 734 791]);

// Example #3 (1D folded)
Yf = 1 + asin(sin(Y));  // Raw folded recovered Y [2.pi], + constant Y shift
Yunf = unwrap(Yf, "unfold");
assert_checkequal(size(Yunf), size(Y));
assert_checkalmostequal(max(Yunf), 9.4279967527199310950436, [], 1e-12);
assert_checkalmostequal(min(Yunf), -12.436144421661456505035, [], 1e-12);

// Example #4 (1D folded)
Yf = 1 + Y/10 + acos(cos(Y)); // Raw recovered Y [2.pi], + linear trend
[Yunf, K] = unwrap(Yf, "unfold");
assert_checkequal(size(Yunf), size(Y));
assert_checkalmostequal(max(Yunf), 15.801371238872524926933, [], 1e-12);
assert_checkalmostequal(min(Yunf), -6.1759877188984493301405, [], 1e-12);
assert_checkequal(K, [24 75 138 233 451 546 609 660 704 743 779]);

//Unwrapping 2D surfaces:
nx = 300;
ny = 400;
rmax = 8.8;
x = linspace(-rmax/2, rmax/2, nx)-1;
y = linspace(-rmax/2, rmax/2, ny)+1;
[X, Y] = meshgrid(x, y);

// Example #5 : 2D wrapped
Z = X.^2 + Y.^2;        // Paraboloïd
m = 2.8;
Zw = pmodulo(Z, m);     // >raps it
Zunw  = unwrap(Zw, 0);  // Unwraps it in both directions, with free jumps
assert_checkequal(size(Zunw), size(Z));
assert_checkalmostequal(max(Zunw), 19.120000000000032969183, [], 1e-12);
assert_checkalmostequal(min(Zunw), -39.199790375290433531, [], 1e-12);
ZunwR = unwrap(Zw, 0, "r"); // Unwraps it along rows
assert_checkequal(size(ZunwR), size(Z));
assert_checkalmostequal(max(ZunwR), 2.78738299382542109583, [], 1e-12);
assert_checkalmostequal(min(ZunwR), -28.995103166214036605197, [], 1e-12);
ZunwC = unwrap(Zw, 0, "c"); // Unwraps it along columns
assert_checkequal(size(ZunwC), size(Z));
assert_checkalmostequal(max(ZunwC), 20.398076084160148724322, [], 1e-12);
assert_checkalmostequal(min(ZunwC), -11.462196183827872530969, [], 1e-12);

// Example #6 : 2D wrapped
Z = sqrt(0.3+sinc(sqrt(Z)*3))*17-7; // Defines the surface
m = 2.8;                     // Wrapping step (jump's amplitude)
Zw = pmodulo(Z, m);          // Wraps it
Zunw  = unwrap(Zw, m);       // Unwraps it in both directions, with given jump
assert_checkequal(size(Zunw), size(Z));
assert_checkalmostequal(max(Zunw), 12.380638179897072603808, [], 1e-12);
assert_checkalmostequal(min(Zunw), -2.109245308884592162713, [], 1e-12);
ZunwR = unwrap(Zw, m, "r"); // Unwraps it along rows
assert_checkequal(size(ZunwR), size(Z));
assert_checkalmostequal(max(ZunwR), 12.380638179897072603808, [], 1e-12);
assert_checkalmostequal(min(ZunwR), -2.109245308884592162713, [], 1e-12);
ZunwC = unwrap(Zw, m, "c"); // Unwraps it along columns
assert_checkequal(size(ZunwC), size(Z));
assert_checkalmostequal(max(ZunwC), 12.380638179897072603808, [], 1e-12);
assert_checkalmostequal(min(ZunwC), -2.1092453088845903863557, [], 1e-12);
