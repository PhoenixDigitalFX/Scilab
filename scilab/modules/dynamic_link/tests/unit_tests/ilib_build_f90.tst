// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009 - DIGITEO - Sylvestre LEDRU
// Copyright (C) 2009 - DIGITEO - Michael BAUDIN
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->
// <-- CLI SHELL MODE -->

// Here with give a complete example on adding new primitive to Scilab
// Note that is a unitary test but it could have been a non reg test of bug
// 3488 but it is not because there was no fix to make it work.
//creating the interface file

// Checks on windows that we have a Fortran 90 compiler (Intel)

if haveacompiler() then
  if ( (getos() == 'Windows' & findmsifortcompiler() <> 'unknown') | (getos() <> 'Windows') ) then
    ilib_verbose(0);
    sourcecode=['subroutine incrdoublef90(x,y)'
                '  implicit none'
                '  double precision, intent(in) :: x'
                '  double precision, intent(out) :: y'
                '  y=x+1'
                'end subroutine incrdoublef90'];
    cd(TMPDIR);
    mputl(sourcecode,'incrdoublef90.f90');
    libpath=ilib_for_link('incrdoublef90','incrdoublef90.f90',[],'f');
    exec('loader.sce');
    n = 1.;
    m = call("incrdoublef90",n,1,"d","out",[1,1],2,"d");
    if abs(m-2.)>%eps then pause,end
    n = 2.;
    m = call("incrdoublef90",n,1,"d","out",[1,1],2,"d");
    if abs(m-3.)>%eps then pause,end
  end
end
