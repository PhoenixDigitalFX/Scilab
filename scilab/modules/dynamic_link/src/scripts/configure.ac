#
# Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
# Copyright (C) INRIA - 2006-2008 - Sylvestre Ledru
# Copyright (C) DIGITEO - 2009-2010 - Sylvestre Ledru
# Copyright (C) Scilab Enterprises - 2015 - Clement DAVID
# 
# Copyright (C) 2012 - 2016 - Scilab Enterprises
#
# This file is hereby licensed under the terms of the GNU GPL v2.0,
# pursuant to article 5.3.4 of the CeCILL v.2.1.
# This file was originally licensed under the terms of the CeCILL v2.1,
# and continues to be available under such terms.
# For more information, see the COPYING file which you should have received
# along with this program.
#

##########
### Configure.ac is used to create the configure file which will be 
### used by the incremental link to detect compilers, flags, linker...
### Should be multiplateform
##########

# Initialise autoconf
AC_INIT([scilab],[0],[https://gitlab.com/scilab/scilab/-/issues])
AC_CONFIG_MACRO_DIR([m4])

# Initialise automake (foreign is low strictness)
AM_INIT_AUTOMAKE([foreign]) 

AM_MAINTAINER_MODE

# Initialise libtool
LT_INIT([shared disable-static dlopen])

# Detect C compiler
AC_PROG_CC

# Detect C++ compiler and enforce c++11
AC_PROG_CXX
AX_CXX_COMPILE_STDCXX_11(noext,mandatory)

# Detect Fortran Compiler (77 and 90)
AC_PROG_F77
AC_F77_LIBRARY_LDFLAGS
AC_PROG_FC
AC_FC_LIBRARY_LDFLAGS

# Initialise libtool
LT_INIT
# Specify which Makefile.in should be "adapted"
AC_CONFIG_FILES([Makefile])

AC_PROG_CPP
AC_PROG_GREP

# x86_64 needs -fPIC
case "$host" in
  x86_64-*-linux*)
    CFLAGS="$CFLAGS -fPIC"
    CXXFLAGS="$CXXFLAGS -fPIC"
    FFLAGS="$CXXFLAGS -fPIC"
    FCFLAGS="$FCFLAGS -fPIC"
    ;;
esac

# Configure the Makefile
AC_OUTPUT


echo ""
echo "Options used to compile and link:"
echo "  CC               = $CC"
echo "  CFLAGS           = $CFLAGS"
echo "  CPP              = $CPP"
echo "  CPPFLAGS         = $CPPFLAGS"
echo "  PCFLAGS          = $PCFLAGS"
echo "  DEFS             = $DEFS"
echo "  LD               = $LD"
echo "  LDFLAGS          = $LDFLAGS"
echo "  LIBS             = $LIBS"
echo "  CXX              = $CXX"
echo "  CXXFLAGS         = $CXXFLAGS"
echo "  F77              = $F77"
echo "  FFLAGS           = $FFLAGS"
echo "  FLIBS            = $FLIBS"
echo "  FC               = $FC"
echo "  FFLAGS           = $FCFLAGS"
echo "  FCLIBS           = $FCLIBS"
echo ""
