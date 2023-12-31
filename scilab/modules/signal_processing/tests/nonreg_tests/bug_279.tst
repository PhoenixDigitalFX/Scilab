//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 279 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/279
//
// <-- Short Description -->
//   Wrong zeros values



format(20);

Fs= 44100.0;	// Sample Freq in Hz
om1= 1765.0;	// lower stop corner  Hz
om2= 2205.0;	// lower pass corner  Hz
om3= 4410.0;	// higher pass corner Hz
om4= 5427.6;	// higher stop corner Hz

gripple=   0.2;	// passband ripple in dB
gstop  = -40.0;	// stop band attenuation in dB


a1= 2*%pi*om1/Fs;
a2= 2*%pi*om2/Fs;
a3= 2*%pi*om3/Fs;
a4= 2*%pi*om4/Fs;

om=[a1, a2, a3, a4 ];

deltap= 1.0 - 10.00**(-0.05*gripple);
deltas= 10.00**(0.05* gstop) ;

[cells,fact,zers,pols]=eqiir('bp','el',om,deltap,deltas);

if zers($)==0 | zers($-1)==0 then pause,end
