// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Serge STEER <serge.steer@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2453 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2453
//
// <-- Short Description -->
//     -->mgetstr()
//               !--error 77
//     mgetstr: Mauvais nombre d'argument(s) d'entrée: 1 à 3 attendu.
//
//     and in the doc:
//         str=mgetstr(n [,fd] )
//
//     what is the third ?

if execstr("mgetstr()","errcatch") == 0 then pause,end
if lasterror() <> msprintf(gettext("%s: Wrong number of input argument(s): %d to %d expected.\n"), "mgetstr", 1, 2) then pause,end
