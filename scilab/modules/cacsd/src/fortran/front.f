
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

      subroutine front(nq,tq,nbout,w)
C!but
C     cette routine calcule le nombre de racines  du polynome q(z) qui
C     sont situees a l'exterieur du cercle unite .
C!liste d'appel
C     subroutine front(nq,tq,nbout,w)
C     dimension tq(0:*),w(*)
C     Entree :
C     - nq . est le degre du polynome q(z)
C     - tq   . le tableau du polynome en question
C
C     Sortie :
C     -nbout . est le nombre de racine a l'exterieur du  du cercle unite
C     tableau de travail
C     -w 3*nq+1
C!

      implicit double precision (a-h,o-z)
      dimension tq(nq+1), w(*)
C
      integer fail
C
      lpol = 1
      lzr = lpol + nq + 1
      lzi = lzr + nq
      lzmod = lpol
      lfree = lzi + nq
C
      call dcopy(nq+1,tq,1,w(lpol),-1)
      call rpoly(w(lpol),nq,w(lzr),w(lzi),fail)
      call modul(nq,w(lzr),w(lzi),w(lzmod))
C
      nbout = 0
      nbon = 0
      do 110 i = 1,nq
        if (w(lzmod-1+i) .gt. 1.0d+0) then
          nbout = nbout + 1
        endif
        if (w(lzmod-1+i) .eq. 1.0d+0) then
          nbon = nbon + 1
        endif
 110  continue
C
      return
      end

