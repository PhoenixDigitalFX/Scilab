// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Bruno JOFRET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// =============================================================================
// Tests for standard deviation
// =============================================================================
// <-- NO CHECK REF -->
// <-- CLI SHELL MODE -->

assert_checkequal(stdev(0), 0);
assert_checkequal(stdev(zeros(3,3)), 0);
assert_checkequal(stdev(zeros(3,3,3)), 0);
assert_checkequal(stdev(1, 1), 0);
assert_checkequal(stdev(1, 2), 0);

rand("seed", 0);
a = rand(3, 3, 3);
refY = 0.272002431404198;

y0 = stdev(a);
ys = stdev(a, "*");
assert_checkalmostequal(y0, refY);
assert_checkalmostequal(ys, refY);

refY = [0.3899896462733005  0.1836990129394737  0.1038925147784040];
refY(:, :, 2) = [0.3177134004419370  0.2681129484277341  0.0087779568439578];
refY(:, :, 3) = [0.2897656318619816  0.3895404996160437  0.1425603832951185];
y1 = stdev(a, 1);
yr = stdev(a, "r");
assert_checkalmostequal(y1, refY);
assert_checkalmostequal(yr, refY);

refY = [0.3394940617212404 ; 0.0475705580641355 ; 0.4523801086433633];
refY(:, :, 2) = [0.342549229474548 ; 0.2004197906845895 ; 0.2310186249368761];
refY(:, :, 3) = [0.3165165021017580 ; 0.2336663995922139 ; 0.1479958923819589];
y2 = stdev(a, 2);
yc = stdev(a, "c");
assert_checkalmostequal(y2, refY);
assert_checkalmostequal(yc, refY);

// Mean squared deviation

refY = 0.2669178254690693;
ys = stdev(a, "*", mean(a));
assert_checkalmostequal(ys, refY);

refY = [0.3184252127793632  0.1499896159848785  0.0848278831005502];
refY(:, :, 2) = [0.2594119051757631  0.2189133056936967  0.0071671717506227];
refY(:, :, 3) = [0.2365926476856702  0.3180584860693779  0.1164000655362104];
y1 = stdev(a, 1, mean(a,"r"));
yr = stdev(a, "r", mean(a,"r"));
assert_checkalmostequal(y1, refY);
assert_checkalmostequal(yr, refY);

refY = [0.2771957406406592 ; 0.0388411980121906 ; 0.3693668119870194];
refY(:, :, 2) = [0.2796902746653962 ; 0.1636420738442178 ; 0.1886259173915840];
refY(:, :, 3) = [0.2584346417732888 ; 0.1907878163447345 ; 0.1208381401212172];
y2 = stdev(a, 2, mean(a,"c"));
yc = stdev(a, "c", mean(a,"c"));
assert_checkalmostequal(y2, refY);
assert_checkalmostequal(yc, refY);

// Overloading
m = rand(3,4)*100;
    // for a built-in type
function s = %i_stdev(ob, varargin)
    s = stdev(double(ob), varargin(:));
endfunction
ob = uint8(m);
r = fix(m);
assert_checkequal(stdev(ob),stdev(r));
assert_checkequal(stdev(ob, 1), stdev(r, 1));
assert_checkequal(stdev(ob, 2), stdev(r, 2));
assert_checkequal(stdev(ob, 2, 0.1), stdev(r, 2, 0.1));
assert_checkequal(stdev(ob, 1, 0:0.05:0.16), stdev(r, 1, 0:0.05:0.16));
    // for a typed list
function s = %mytype_size(ob, varargin)
    s = size(ob.mat, varargin(:));
endfunction
function s = %mytype_stdev(ob, varargin)
    s = stdev(ob.mat, varargin(:));
endfunction
ob = mlist(["mytype","mat","title"], m, "A test object");
assert_checkequal(stdev(ob),stdev(m));
assert_checkequal(stdev(ob, 1), stdev(m, 1));
assert_checkequal(stdev(ob, 2), stdev(m, 2));
assert_checkequal(stdev(ob, 2, 10), stdev(m, 2, 10));
assert_checkequal(stdev(ob, 1, 0:5:16), stdev(m, 1, 0:5:16));


