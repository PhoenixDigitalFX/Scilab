//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// =============================================================================
// Tests for cdfnbn() function
// =============================================================================

prec        = 1.e-5;

S           = 2;
Xn          = 10;
Pr          = 0.4;
Ompr        = 1-Pr;
[P,Q]       = cdfnbn("PQ",S,Xn,Pr,Ompr);
[S1]        = cdfnbn("S",Xn,Pr,Ompr,P,Q);
[Xn1]       = cdfnbn("Xn",Pr,Ompr,P,Q,S);
[Pr1,Ompr1] = cdfnbn("PrOmpr",P,Q,S,Xn);

if norm(Pr1-Pr) > prec then pause,end
if norm(Xn1-Xn) > prec then pause,end
if norm(S1-S)   > prec then pause,end
