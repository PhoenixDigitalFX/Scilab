//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA -Serge Steer
// Copyright (C) 2009-2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 68 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/68
//
// <-- Short Description -->
//Precision problem with the trzeros function,


//
// sort_merge --
//   Returns the sorted array x.
// Arguments
//   x : the array to sort
//   compfun : the comparison function
//   data : an optional data to pass to the comparison function
// Bruno Pincon
// "quelques tests de rapidit´e entre diff´erents logiciels matriciels"
// Modified by Michael Baudin to manage a comparison function
//
function [x] = sort_merge ( varargin )
    [lhs,rhs]=argn();
    if ( ( rhs<>1 ) & ( rhs<>2 ) & ( rhs<>3 ) ) then
        errmsg = sprintf("Unexpected number of arguments : %d provided while 1, 2 or 3 are expected.",rhs);
        error(errmsg)
    end
    // Get the array x
    x = varargin(1);
    // Get the comparison function compfun
    if rhs==1 then
        compfun = sort_merge_comparison;
    else
        compfun = varargin(2);
        if ( rhs == 3 ) then
            data = varargin(3);
        end
    end
    // Proceed...
    n = length(x)
    if n > 1 then
        m = floor(n/2);
        p = n-m
        if ( rhs == 3 ) then
            x1 = sort_merge ( x(1:m) , compfun , data )
            x2 = sort_merge ( x(m+1:n) , compfun , data )
        else
            x1 = sort_merge ( x(1:m) , compfun )
            x2 = sort_merge ( x(m+1:n) , compfun )
        end
        i = 1;
        i1 = 1;
        i2 = 1;
        for i = 1:n
            if ( rhs == 3 ) then
                order = compfun ( x1(i1) , x2(i2) , data );
            else
                order = compfun ( x1(i1) , x2(i2) );
            end
            if order<=0 then
                x(i) = x1(i1)
                i1 = i1+1
                if (i1 > m) then
                    x(i+1:n) = x2(i2:p)
                    break
                end
            else
                x(i) = x2(i2)
                i2 = i2+1
                if (i2 > p) then
                    x(i+1:n) = x1(i1:m)
                    break
                end
            end
        end
    end
endfunction

//
// sort_merge_comparison --
//   The default comparison function used in the sort-merge.
//   Returns -1 if x < y,
//   returns 0 if x==y,
//   returns +1 if x > y
//
function order = sort_merge_comparison ( x , y )
    if x < y then
        order = -1
    elseif x==y then
        order = 0
    else
        order = 1
    end
endfunction

function order = mycomparison ( x , y , data )
    order = assert_comparecomplex(x,y,data(1),data(2))
endfunction


s=poly(0,"s");
A=[-113.63636,-2840909.1,113.63636,2840909.1,0,0;
1,0,0,0,0,0;
347.22222,8680555.6,-366.66667,-11111111,19.444444,2430555.6;
0,0,1,0,0,0;
0,0,50,6250000,-50,-6250000;
0,0,0,0,1,0];

System =syslin("c",A,[1;0;0;0;0;0],[0 0 0 1 0 0]);

Td=1/0.1;
alpha=1000;
Ti=1/0.1;
Tr=1/10000;
Kp=1e2;
PID=tf2ss(syslin("c",Kp*(1+Td*s)/(1+Td/alpha*s)));

Hrond1=PID*System;
closed1=(1/.(Hrond1));
ClosedZeros1=trzeros(closed1);

Hrond2=System*PID;
closed2=(1/.(Hrond2));
ClosedZeros2=trzeros(closed2);

computed1 = sort_merge ( ClosedZeros1 , mycomparison , [ 10 * %eps , 0.0 ] );
computed2 = sort_merge ( ClosedZeros2 , mycomparison , [ 10 * %eps , 0.0 ] );

assert_checkalmostequal ( computed1 , computed2, [] , 1.e-7 );

