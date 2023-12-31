;
; Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
; Copyright (C) 2015 - Scilab Enterprises
;
; Copyright (C) 2012 - 2016 - Scilab Enterprises
;
; This file is hereby licensed under the terms of the GNU GPL v2.0,
; pursuant to article 5.3.4 of the CeCILL v.2.1.
; This file was originally licensed under the terms of the CeCILL v2.1,
; and continues to be available under such terms.
; For more information, see the COPYING file which you should have received
; along with this program.
;
;-------------------------------------------------------------------------------
; Inno Setup Script (5.3 and more) for Scilab (UNICODE version required)
;
;-------------------------------------------------------------------------------
; MKL library setup
;-------------------------------------------------------------------------------
;
Source: bin\mkl\README.md; DestDir: {app}\bin; DestName: "README-MKL.md"; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\mkl\blasplus.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\mkl\lapack.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\1033\ifcore_msg.dll; DestDir: {app}\bin\1033; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\1033\irc_msg.dll; DestDir: {app}\bin\1033; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\1033\libmUI.dll; DestDir: {app}\bin\1033; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libmmd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libmmdd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libmmd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\svml_dispmd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libifcoremd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libifcoremdd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libifcorert.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libifcorertd.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
Source: bin\libiomp5md.dll; DestDir: {app}\bin; Components: {#COMPN_MKL_CPU_LIBRARY}
