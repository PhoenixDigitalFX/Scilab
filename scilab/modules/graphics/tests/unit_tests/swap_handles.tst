// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
// Copyright (C) 2014 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->
// <-- NO CHECK REF -->

// first test : swap two brothers
a1 = gca() ;
xrect(0.1,0.1,0.1,0.1);
xx =-3:0.1:3 ;
plot(xx,xx);
swap_handles(a1.children(1), a1.children(2) ) ;

if ( a1.children(1).type <> "Rectangle" ) then pause,end
if ( a1.children(2).type <> "Compound"  ) then pause,end

// second test : swap two objects from different figure
scf() ;
a2 = gca() ;
xarc( 0.5,0.5,0.5,0.5,0,64 * 360 ) ;
e = gce() ;
swap_handles( e, a1.children(1) ) ;

if ( a1.children(1).type <> "Arc" ) then pause,end
if ( a2.children(1).type <> "Rectangle" ) then pause,end

assert_checkerror("swap_handles(e, a1)", msprintf(_("%s: Handles do not have the same parent type neither the same type.\n"), "swap_handles"));

// third test : swap two objects from different figure
close( winsid() ) ;
plot3d ;
a1 = gca() ;
e1 = gce() ;

scf() ;
plot2d ;
e2 = gce() ;
a2 = gca() ;

swap_handles( e1, e2 ) ;
if ( e1.parent <> a2 ) then pause,end
if ( e2.parent <> a1 ) then pause,end

// fourth test : swap two handles from two different figures
close( winsid() ) ;
plot3d ;
f1 = gcf() ;
a1 = gca() ;

scf() ;
plot2d ;
f2 = gcf() ;
a2 = gca() ;

swap_handles( a1, a2 ) ;

if ( a1.parent <> f2 ) then pause,end
if ( a2.parent <> f1 ) then pause,end

close( winsid() ) ;
