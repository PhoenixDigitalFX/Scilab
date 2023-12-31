// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Jean-Baptiste SILVY <jean-baptiste.silvy@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 1491 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1491
//
// <-- Short Description -->
//    Bug detected in 3.1.1 under Windows XP.
//    Bug relative to handle Rectangle
//
//    The default value Axes.clip_box is not inherited in Rectangle.clip_box
//
//    Jacques-Deric

clipBox = [0.1,0.9,0.8,0.8] ;

a = gca() ;
a.box        = 'on' ;
// draw the clipping boundaries
xrect( clipBox(1), clipBox(2), clipBox(3), clipBox(4) ) ;
r1 = gce() ;
a.clip_box   = clipBox ;
a.clip_state = 'on' ;

xfrect( 0.0, 0.5, 0.5, 0.5 ) ;
r2 = gce() ;

xpoly([0,1],[0,1]) ;
p1 = gce() ;

checkR1 = ( r1.clip_state == 'off' ) ;
checkR2 = ( r2.clip_state == 'on'  ) & ( r2.clip_box == clipBox ) ;
checkP1 = ( p1.clip_state == 'on'  ) & ( p1.clip_box == clipBox ) ;

// check if the clip_box is set for objects wich are
// created after the axes have been clipped

if ~checkR1 then pause,end
if ~checkR2 then pause,end
if ~checkP1 then pause,end
