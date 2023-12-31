// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- TEST WITH GRAPHIC -->
//
// <-- ENGLISH IMPOSED -->
//
old=driver("null");
function r=checkbode(h,leg)
    fig=gcf();
    r=%t;
    ap=fig.children(1);
    am=fig.children(2);
    if am.log_flags<>"lnn" then r=%f;return,end
    if or(am.axes_visible<>["on","on","on"]) then r=%f;return,end
    if ap.log_flags<>"lnn" then  r=%f;return,end
    if or(ap.axes_visible<>["on","on","on"]) then r=%f;return,end

    n=size(am.children($).children,"*");
    if n<>size(h,1) then pause,end
    for k=1:n;
        pm=am.children($).children(n+1-k);
        pp=ap.children($).children(n+1-k);
        if or(pm.data(:,1)<>pp.data(:,1)) then ;r=%f;return,end
        [frq,rf]=repfreq(h(k,1),pm.data(:,1));[phi,d]=phasemag(rf);
        if norm(d(:)-pm.data(:,2))> 1d-15 then r=%f;return,end
    end
    if argn(2)==2 then
        if size(ap.children,"*")<2 then r=%f;return,end
        if ap.children(1).type<>"Legend" then r=%f;return,end
        if size(ap.children(1).links,"*")<>n then r=%f;return,end
        if or(ap.children(1).text<>leg(:)) then r=%f;return,end
    end
endfunction

s=poly(0,"s");
n=1+s;d=1+2*s;
h=syslin("c",n,d);
sl=tf2ss(h);

sld=dscr(sl,0.01);
hd=ss2tf(sld);

[w,rf]=repfreq(h,0.01,100);

// Continuous time
clf();bode(h);
assert_checktrue(checkbode(h));

clf();bode(h,"h");
assert_checktrue(checkbode(h,"h"));

clf();bode(h,0.01,100);
assert_checktrue(checkbode(h));
clf();bode(h,0.01,100,"h");
assert_checktrue(checkbode(h,"h"));

clf();bode(h,0.01,100,0.01);
assert_checktrue(checkbode(h));
clf();bode(sl,0.01,100);
assert_checktrue(checkbode(sl));
clf();bode(sl,0.01,100,0.01);

// Continuous time SIMO
h=[h;h+1];sl=[sl;sl+1];
clf();bode(h);
assert_checktrue(checkbode(h));
clf();bode(zpk(h));
assert_checktrue(checkbode(zpk(h)));

clf();bode(h,["h";"h+1"]);
assert_checktrue(checkbode(h,["h";"h+1"]));
clf();bode(zpk(h),["h";"h+1"]);
assert_checktrue(checkbode(zpk(h),["h";"h+1"]));

clf();bode(h,0.01,100);
assert_checktrue(checkbode(h));
clf();bode(h,0.01,100,["h";"h+1"]);
assert_checktrue(checkbode(h,["h";"h+1"]));

clf();bode(h,0.01,100,0.01);
assert_checktrue(checkbode(h));
clf();bode(sl,0.01,100);
assert_checktrue(checkbode(sl));
clf();bode(sl,0.01,100,0.01);


// Discrete case
clf();bode(hd);
assert_checktrue(checkbode(hd));
clf();bode(hd,"h");
assert_checktrue(checkbode(hd,"h"));

clf();bode(hd,0.01,100);
assert_checktrue(checkbode(hd));
clf();bode(hd,0.01,100,"h");
assert_checktrue(checkbode(hd,"h"));

clf();bode(hd,0.01,100,0.01);
assert_checktrue(checkbode(hd));
clf();bode(sld,0.01,100);
assert_checktrue(checkbode(sld));
clf();bode(sl,0.01,100,0.01);

// Discrete case SIMO
hd=[hd;hd+1];sld=[sld;sld+1];
clf();bode(hd);
assert_checktrue(checkbode(hd));
clf();bode(hd,["h";"h+1"]);
assert_checktrue(checkbode(hd,["h";"h+1"]));
clf();bode(zpk(hd),["h";"h+1"]);
assert_checktrue(checkbode(zpk(hd),["h";"h+1"]));

clf();bode(hd,0.01,100);
assert_checktrue(checkbode(hd));
clf();bode(hd,0.01,100,["h";"h+1"]);
assert_checktrue(checkbode(hd,["h";"h+1"]));

clf();bode(hd,0.01,100,0.01);
assert_checktrue(checkbode(hd));
clf();bode(sld,0.01,100);
assert_checktrue(checkbode(sld));
clf();bode(sl,0.01,100,0.01);

// bode given by precomputed frequency response
h=syslin("c",n,d);
clf();bode(h,0.01,100);
fig=gcf();
dp=fig.children(1).children($).children.data;
dm=fig.children(2).children($).children.data;
[w,rf]=repfreq(h,0.01,100);

clf(); bode(w,rf);
fig=gcf();
if norm(dp-fig.children(1).children($).children.data)>1d-13 then pause,end
if norm(dm-fig.children(2).children($).children.data)>1d-13 then pause,end

clf(); bode(w,20*log(abs(rf))/log(10),(180/%pi)*atan(imag(rf),real(rf)))
fig=gcf();
if norm(dp-fig.children(1).children($).children.data)>1d-13 then pause,end
if norm(dm-fig.children(2).children($).children.data)>1d-13 then pause,end

// Bode_asymp()
s = %s;
G = (s+10)/(s*(s+100)); // A rational matrix
sys = syslin("c", G); // A continuous-time linear system in transfer matrix representation.
f_min = .0001; f_max = 1600; // Frequencies in Hz

clf(); bode(sys, f_min, f_max, "rad"); // The optional argument "rad" converts Hz to rad/s

bode_asymp(sys, 10, 1000); // Plots asymptotes in the given range of frequency (in rad/s).

clf(); bode(zpk(sys), f_min, f_max, "rad"); // The optional argument "rad" converts Hz to rad/s
bode_asymp(zpk(sys), 10, 1000); // Plots asymptotes in the given range of frequency (in rad/s).
driver(old);
