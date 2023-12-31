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
      subroutine n1gc2b(n,simul,prosca,xinit,f,dg,alpha,d,
     /                  xfinal,gfinal,iprint,io,retour,ntotap,nsim,
     /                  intfor,dx,eps,izs,rzs,dzs)
c
      implicit double precision (a-h,o-z)
c     parametres
      double precision  zero      , deux     , trois
      parameter (       zero=0.0d+0 , deux=2.0d+0, trois=3.0d+0 )
      double precision  dixiem      , petit
      parameter (       dixiem=.10d+0 , petit=.00010d+0 )
      double precision  unplus       , unmoin      , envir1
      parameter  (      unplus=1.010d+0, unmoin=.990d+0, envir1=.90d+0 )
c declarations des tableaux
      double precision  xinit(n),d(n),xfinal(n),gfinal(n),dzs(*)
      real rzs(*)
      integer     izs(*)
c declarations des scalaires
      double precision f, finit, dg, alpha, eps, dx, ap, dp, fp,
     /                  aux1, aux2, pas, at, dal, bsup, delta
      integer  n, iprint, io, retour, nsim, ntotap, nappel, indic, j
      logical  intfor, maxpas, rfinie, accept, encadr, depas
      external prosca, simul
      character bufstr*(4096)
c
c initialisations
      depas=.false.
      bsup=zero
      finit=f
      nappel=0
      ap=zero
      fp=finit
      dp=dg
      if (iprint .gt. 3) then
         write(bufstr,1) alpha, dg
         call basout(io_out ,io ,bufstr(1:lnblnk(bufstr)))
      endif
c calcul de la longueur du pas
      call prosca(n,d,d,pas,izs,rzs,dzs)
      pas=sqrt(pas)
c test d'erreur dans la recherche lineaire
1000  continue
      if (alpha * pas .le. dx) then
      if (iprint .gt. 3) then
        write(bufstr,1001)
        call basout(io_out ,io ,bufstr(1:lnblnk(bufstr)))
      endif
      retour=1
      return
      else if (ntotap .eq. nsim) then
      retour=3
      return
      else
      continue
      endif
c calcul du nouveau point susceptible d'etre xfinal
      do 2000 j=1,n
      xfinal(j)=xinit(j) + alpha * d(j)
2000  continue
c calculs de f et g en ce point
      indic=4
      call simul(indic,n,xfinal,f,gfinal,izs,rzs,dzs)
      nappel=nappel + 1
      ntotap=ntotap + 1
      if (indic .lt. 0) then
      depas=.true.
      if (iprint . gt. 3) then
        write(bufstr,2001) alpha,indic
        call basout(io_out ,io ,bufstr(1:lnblnk(bufstr)))
      endif
      delta=alpha - ap
      if (delta .le. dx) then
      retour=4
      return
      else
      bsup=alpha
      alpha=delta * dixiem + ap
      goto 1000
      endif
      endif
c calcul de la derivee suivant d au point xfinal
      call prosca(n,d,gfinal,dal,izs,rzs,dzs)
c
      if (iprint .gt. 3) then
        aux2=f - finit
        write(bufstr,2002) alpha, aux2, dal
        call basout(io_out ,io ,bufstr(1:lnblnk(bufstr)))
      endif
      if (indic .eq. 0) then
      retour=2
      return
      endif
      maxpas=(f .gt. finit) .and. (dal .lt. zero)
      if (maxpas) then
      alpha=alpha / trois
      ap=zero
      fp=finit
      dp=dg
      rfinie=.false.
c
      else
c test:le nouveau point est il acceptable
      aux1=finit + petit * alpha * dg
      aux2=abs(dal/dg)
      accept=(f .le. aux1) .and. (aux2 .le. envir1)
      if (accept) then
c doit on faire une interpolation
      rfinie=(nappel .gt. 1) .or. (.not. intfor) .or. (aux2 .le. eps)
      else
      rfinie=.false.
      endif
c
      if (.not. rfinie) then
c la recherche lineaire n'est pas finie. interpolation
      aux1=dp + dal- trois*(fp-f)/(ap-alpha)
      aux2=aux1 * aux1 - dp * dal
      if (aux2 .le. zero) then
      aux2=zero
      else
      aux2=sqrt(aux2)
      endif
      if (dal-dp+ deux * aux2 .eq. zero) then
      retour=4
      return
      endif
      at=alpha - (alpha-ap)*(dal+aux2-aux1)/(dal-dp+ deux * aux2)
c test:le minimum a t-il ete encadre
      encadr=(dal/dp) .le. zero
      if (encadr) then
c le minimum a ete encadre
      if (abs(alpha - ap) .le. dx) then
      retour=4
      return
      endif
      aux1=unplus * min(alpha,ap)
      aux2=unmoin * max(alpha,ap)
      if ((at .lt. aux1) .or. (at .gt. aux2)) at=(alpha + ap)/deux
      else
c le minimum n'a pas ete encadre
      aux1=unmoin * min(ap,alpha)
      if ((dal .le. zero) .or. (at .le. zero) .or. (at .ge. aux1)) then
      aux1=unplus * max(ap,alpha)
      if ((dal .gt. zero) .or. (at .le. aux1))  then
      if (dal .le. zero) then
      at=deux * max(ap,alpha)
      else
      at=min(ap,alpha) / deux
      endif
      endif
      endif
      endif
      if ( (depas) .and. (at .ge. bsup)) then
      delta=bsup - alpha
      if (delta .le. dx) then
      retour=4
      return
      else
      at=alpha + delta * dixiem
      endif
      endif
      ap=alpha
      fp=f
      dp=dal
      alpha=at
      endif
      endif
      if (rfinie) then
      retour=0
      return
      else
      goto 1000
      endif
1     format(7h n1gc2b,6x,5h  pas,d10.3,5h  dg=,d9.2)
1001  format(21h n1gc2b    fin sur dx)
2001  format(7h n1gc2b,20x,d10.3,8h  indic=,i3)
2002  format(7h n1gc2b,20x,d10.3,2d11.3)
      end
