c Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
c Copyright (C) INRIA
c 
c Copyright (C) 2012 - 2016 - Scilab Enterprises
c
c This file is hereby licensed under the terms of the GNU GPL v2.0,
c pursuant to article 5.3.4 of the CeCILL v.2.1.
c This file was originally licensed under the terms of the CeCILL v2.1,
c and continues to be available under such terms.
c For more information, see the COPYING file which you should have received
c along with this program.
c
      double precision function infinity(x)
c Purpose
c     Return infinity value	
c Syntax
c     a = infinity(0.0d)
c
      double precision x
      
      infinity = 1.0d0/x
      
      return 
      end      
