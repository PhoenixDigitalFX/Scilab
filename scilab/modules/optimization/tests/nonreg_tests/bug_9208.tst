// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 9208 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/9208
//
// <-- Short Description -->
// Added three optional output arguments to optim(), to retrieve #iterations,
// #evaluations and a termination flag.
//

// Example 1
a  = 1.0;
b  = 2.0;
c  = 3.0;
d  = 4.0;
x0 = [1 1];
function [f, g, ind] = costfunction(x, ind, a, b, c, d)
    f = a * ( x(1) - c ) ^2 + b * ( x(2) - d )^2;
    g(1) = 2 * a * ( x(1) - c );
    g(2) = 2 * b * ( x(2) - d );
endfunction
costf = list ( costfunction , a , b , c, d );

[fopt, xopt, w, g, iters, evals, err] = optim ( costf , x0 );
assert_checkequal([iters evals err], [10 11 1]);

[fopt, xopt, w, g, iters, evals, err] = optim ( costf , x0 , "ar",nap=5 );
assert_checkequal([iters evals err], [4 5 4]);

[fopt, xopt, w, g, iters, evals, err] = optim ( costf , x0 , "ar",nap=100,iter=5 );
assert_checkequal([iters evals err], [6 7 5]);


// Example 2 (based on old 'derivative' function using fixed step)
x0 = [-1.2 1.0];
function f = rosenbrock(x)
    f = 100.0 *(x(2)-x(1)^2)^2 + (1-x(1))^2;
endfunction
function [f, g, ind] = rosenbrockCost2FixedStep(x, ind)
    f = rosenbrock ( x );
    g = numderivative ( rosenbrock , x.' , %eps^(1/4) , order = 4 );
endfunction

[fopt, xopt, g, w, iters, evals, err] = optim ( rosenbrockCost2FixedStep , x0 );
assert_checkalmostequal(xopt,[1,1])
assert_checktrue([iters, evals] <= [38, 51]);
assert_checkequal(err,9);

[fopt, xopt, g, w, iters, evals, err] = optim ( rosenbrockCost2FixedStep , x0 , "ar",nap=10 );
assert_checkequal([iters evals err], [8 10 4]);

[fopt, xopt, g, w, iters, evals, err] = optim ( rosenbrockCost2FixedStep , x0 , "ar",nap=100,iter=10 );
assert_checkequal([iters evals err], [11 14 5]);

// Example 2 (based on new 'numderivative' function using variable step)
x0 = [-1.2 1.0];
function f = rosenbrock(x)
    f = 100.0 *(x(2)-x(1)^2)^2 + (1-x(1))^2;
endfunction
function [f, g, ind] = rosenbrockCost2VariableStep(x, ind)
    f = rosenbrock ( x );
    g = numderivative ( rosenbrock , x.' , order = 4 );
endfunction

[fopt, xopt, g, w, iters, evals, err] = optim ( rosenbrockCost2VariableStep , x0 );
assert_checkequal([iters evals err], [4 100 4]);

[fopt, xopt, g, w, iters, evals, err] = optim ( rosenbrockCost2VariableStep , x0 , "ar",nap=10 );
assert_checkequal([iters evals err], [1 10 4]);

[fopt, xopt, g, w, iters, evals, err] = optim ( rosenbrockCost2VariableStep , x0 , "ar",nap=100,iter=10 );
assert_checkequal([iters evals err], [4 100 4]);
