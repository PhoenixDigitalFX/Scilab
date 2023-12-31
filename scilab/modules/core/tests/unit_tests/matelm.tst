// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA
// Copyright (C) 2013 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
//

//test of matelm functions
//size
a=[1 2;3 4];
assert_checkequal(size(a), [2 2]);
assert_checkequal(size(a+0), [2 2]);
assert_checkequal(size(a, "*"), 4);
assert_checkequal(size(a+0, "*"), 4);
[m,n]=size(a); assert_checkequal([m,n], [2 2]);

a=[1;2];
assert_checkequal(size(a, 1), 2);
assert_checkequal(size(a+0, 1), 2);
assert_checkequal(size(a, "r"), 2);
assert_checkequal(size(a+0, "r"), 2);
assert_checkequal(size(a, 2), 1);
assert_checkequal(size(a+0, 2), 1);
assert_checkequal(size(a, "c"), 1);
assert_checkequal(size(a+0, "c"), 1);
[m,n]=size(a); assert_checkequal([m,n], [2 1]);

a=string([1 2;3 4]);
assert_checkequal(size(a), [2 2]);
assert_checkequal(size(a+a), [2 2]);
assert_checkequal(size(a, "*"), 4);
assert_checkequal(size(a+a, "*"), 4);
[m,n]=size(a); assert_checkequal([m,n], [2 2]);

a=string([1;2]);
assert_checkequal(size(a, 1), 2);
assert_checkequal(size(a+a, 1), 2);
assert_checkequal(size(a, "r"), 2);
assert_checkequal(size(a+a, "r"), 2);
assert_checkequal(size(a, 2), 1);
assert_checkequal(size(a+a, 2), 1);
assert_checkequal(size(a, "c"), 1);
assert_checkequal(size(a+a, "c"), 1);
[m,n]=size(a); assert_checkequal([m,n], [2 1]);

a=[1 2;3 4]+%s;
assert_checkequal(size(a), [2 2]);
assert_checkequal(size(a+0), [2 2]);
assert_checkequal(size(a, "*"), 4);
assert_checkequal(size(a+0, "*"), 4);
[m,n]=size(a); assert_checkequal([m,n], [2 2]);

a=[1;2]+%s;
assert_checkequal(size(a, 1), 2);
assert_checkequal(size(a+0, 1), 2);
assert_checkequal(size(a, "r"), 2);
assert_checkequal(size(a+0, "r"), 2);
assert_checkequal(size(a, 2), 1);
assert_checkequal(size(a+0, 2), 1);
assert_checkequal(size(a, "c"), 1);
assert_checkequal(size(a+0, "c"), 1);
[m,n]=size(a); assert_checkequal([m,n], [2 1]);

a=[1 2;3 4]==1;
assert_checkequal(size(a), [2 2]);
assert_checkequal(size(a&a), [2 2]);
assert_checkequal(size(a, "*"), 4);
assert_checkequal(size(a|a, "*"), 4);
[m,n]=size(a); assert_checkequal([m,n], [2 2]);

a=[1;2]==1;
assert_checkequal(size(a, 1), 2);
assert_checkequal(size(a|a, 1), 2);
assert_checkequal(size(a, "r"), 2);
assert_checkequal(size(a|a, "r"), 2);
assert_checkequal(size(a, 2), 1);
assert_checkequal(size(a|a, 2), 1);
assert_checkequal(size(a, "c"), 1);
assert_checkequal(size(a|a, "c"), 1);
[m,n]=size(a); assert_checkequal([m n], [2 1]);

//eye
assert_checkequal(eye(2,2), [1 0; 0 1]);
assert_checkequal(eye(2,1), [1;0]);

n=2;
assert_checkequal(eye(2,n), [1 0; 0 1]);
assert_checkequal(eye(n, 2), [1 0; 0 1]);
assert_checkequal(eye(n,n), [1 0;0 1]);
assert_checkequal(size(eye()), [-1 -1]);

a=[1 2;3 4];
assert_checkequal(eye(a), [1 0; 0 1]);
assert_checkequal(eye(a+0), [1 0; 0 1]);

a=[1 2;3 4]+%s;
assert_checkequal(eye(a), [1 0;0 1]);
assert_checkequal(eye(a+0), [1 0; 0 1]);

a=string([1 2;3 4]);
assert_checkequal(eye(a), [1 0;0 1]);
assert_checkequal(eye(a+a), [1 0; 0 1]);

a=[1 2;3 4]>1;
assert_checkequal(eye(a), [1 0;0 1]);
assert_checkequal(eye(a&a), [1 0; 0 1]);

assert_checkequal(eye([]), []);

//ones
assert_checkequal(ones(2, 2), [1 1; 1 1]);
assert_checkequal(ones(2, 1), [1; 1]);

n=2;
assert_checkequal(ones(n,2), [1 1; 1 1]);
assert_checkequal(ones(2,n), [1 1; 1 1]);
assert_checkequal(ones(n,n), [1 1; 1 1]);
assert_checkequal(ones(1), 1);
assert_checkequal(ones([]), []);

a=[1 2;3 4];
assert_checkequal(ones(a), [1 1; 1 1]);
assert_checkequal(ones(a+0), [1 1; 1 1]);

a=[1 2;3 4]+%s;
assert_checkequal(ones(a), [1 1; 1 1]);
assert_checkequal(ones(a+0), [1 1; 1 1]);

a=string([1 2;3 4]);
assert_checkequal(ones(a), [1 1; 1 1]);
assert_checkequal(ones(a+a), [1 1; 1 1]);

a=[1 2;3 4]>1;
assert_checkequal(ones(a), [1 1; 1 1]);
assert_checkequal(ones(a&0), [1 1; 1 1]);

//rand
assert_checkequal(size(rand(2,2)), [2 2]);
assert_checkequal(size(rand(2,1)), [2 1]);

n=2;
assert_checkequal(size(rand(n,2)), [n 2]);
assert_checkequal(size(rand(2,n)), [2 n]);
assert_checkequal(size(rand(n,n)), [n n]);

//if or(size(rand())<>[1 1]) then pause,end
assert_checkequal(rand([]), []);

a=[1 2;3 4];
assert_checkequal(size(rand(a)), size(a));
assert_checkequal(size(rand(a+0)), size(a));

a=[1 2;3 4]+%s;
assert_checkequal(size(rand(a)), size(a));
assert_checkequal(size(rand(a+0)), size(a));

//a=string([1 2;3 4]);
//if or(size(rand(a))<>size(a)) then pause,end
//if or(size(rand(a+a))<>size(a)) then pause,end
a=[1 2;3 4]>1;
assert_checkequal(size(rand(a)), size(a));
assert_checkequal(size(rand(a+a)), size(a));

rand("seed",1); assert_checkequal(rand("seed"), 1);
a=2;rand("seed",a); assert_checkequal(rand("seed"), a);

//diag
assert_checkequal(diag([1 2 3]), [1 0 0;0 2 0;0 0 3]);
a=[1 2 3];
assert_checkequal(diag(a), [1 0 0;0 2 0;0 0 3]);
assert_checkequal(diag([1 %i 2]), [1 0 0;0 %i 0;0 0 2]);
a=[1 %i 2 ];
assert_checkequal(diag(a), [1 0 0;0 %i 0;0 0 2]);
a=[1 2 3 4;5 6 7 8];
assert_checkequal(diag(a), [1;6]);
assert_checkequal(diag(a+0), [1;6]);
assert_checkequal(diag(a,1), [2;7]);
assert_checkequal(diag(a+0,1), [2;7]);
assert_checkequal(diag(a,-1), 5);
assert_checkequal(diag(a+0, -1), 5);
assert_checkequal(diag(a,4), []);

a(1,1)=%i;
assert_checkequal(diag(a), [%i; 6]);
assert_checkequal(diag(a+0), [%i;6]);
assert_checkequal(diag(a, 1), [2;7]+0*%i);
assert_checkequal(diag(a+0, 1), [2;7]+0*%i);
assert_checkequal(diag(a, -1), 5+0*%i);
assert_checkequal(diag(a+0, -1), 5+0*%i);
assert_checkequal(diag(a, 4), []);

assert_checkequal(diag([]), []);
assert_checkequal(diag([], 1), []);
assert_checkequal(diag([], -1), []);

a=[];
assert_checkequal(diag(a), []);
assert_checkequal(diag(a, 1), []);
assert_checkequal(diag(a, -1), []);

// triu
a=[1 2 3 4;5 6 7 8];
assert_checkequal(triu(a), [1 2 3 4;0 6 7 8]);
assert_checkequal(triu(a+0), [1 2 3 4;0 6 7 8]);
assert_checkequal(triu(a, 1), [0 2 3 4; 0 0 7 8]);
assert_checkequal(triu(a+0, 1), [0 2 3 4; 0 0 7 8]);
assert_checkequal(triu(a, -1), a);
assert_checkequal(triu(a+0, -1), a);
assert_checkequal(triu(a, 4), 0*a);

a(1,1)=%i;
assert_checkequal(triu(a), [%i 2 3 4;0 6 7 8]);
assert_checkequal(triu(a+0), [%i 2 3 4;0 6 7 8]);
assert_checkequal(triu(a, 1), [0 2 3 4;0 0 7 8]+0*%i);
assert_checkequal(triu(a+0, 1), [0 2 3 4;0 0 7 8]+0*%i);
assert_checkequal(triu(a, -1), a);
assert_checkequal(triu(a+0, -1), a);
assert_checkequal(triu(a,4), 0*a);

assert_checkequal(triu([]), []);
assert_checkequal(triu([], 1), []);
assert_checkequal(triu([], -1), []);

a=[];
assert_checkequal(triu(a), []);
assert_checkequal(triu(a, 1), []);
assert_checkequal(triu(a, -1), []);

//tril
a=[1 2 3 4;5 6 7 8];
assert_checkequal(tril(a), [1 0 0 0;5 6 0 0]);
assert_checkequal(tril(a+0), [1 0 0 0;5 6 0 0]);
assert_checkequal(tril(a, 1), [1 2 0 0;5 6  7 0]);
assert_checkequal(tril(a+0, 1), [1 2 0 0;5 6  7 0]);
assert_checkequal(tril(a, 4), a);
assert_checkequal(tril(a+0, 4), a);
assert_checkequal(tril(a, -3), 0*a);

a(1,1)=%i;
assert_checkequal(tril(a), [%i 0 0 0; 5 6 0 0]);
assert_checkequal(tril(a+0), [%i 0 0 0; 5 6 0 0]);
assert_checkequal(tril(a, 1), [%i 2 0 0; 5 6 7 0]);
assert_checkequal(tril(a+0, 1), [%i 2 0 0;5 6  7 0]);
assert_checkequal(tril(a, 4), a);
assert_checkequal(tril(a+0, 4), a);
assert_checkequal(tril(a, -3), 0*a);

assert_checkequal(tril([]), []);
assert_checkequal(tril([], 1), []);
assert_checkequal(tril([], -1), []);

a=[];
assert_checkequal(tril(a), []);
assert_checkequal(tril(a, 1), []);
assert_checkequal(tril(a, -1), []);

//abs
a=[1 2;-3 4;5 -6];
assert_checkequal(abs(a), [1 2;3 4;5 6]);
assert_checkequal(abs(a+0), [1 2;3 4;5 6]);
assert_checkequal(abs([]), []);

a=[]; assert_checkequal(abs(a), []);
a=[1+%i 2;-3 4;5 -6];
assert_checkequal(abs(a), [sqrt(2) 2;3 4;5 6]);
assert_checkequal(abs(a+0), [sqrt(2) 2;3 4;5 6]);

a=[1 2;-3 4;5 -6]+%s;
assert_checkequal(abs(a), [1 2;3 4;5 6]+%s);
assert_checkequal(abs(a+0), [1 2;3 4;5 6]+%s);

a=[1+%i 2;-3 4;5 -6]+%s;
assert_checkequal(abs(a), [sqrt(2) 2;3 4;5 6]+%s);
assert_checkequal(abs(a+0), [sqrt(2) 2;3 4;5 6]+%s);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(full(abs(a)), [1 2;3 4;5 6]);
assert_checkequal(full(abs(a+a)), 2.*[1 2;3 4;5 6]);

a=sparse([1+%i 2;-3 4;5 -6]);
assert_checkequal(full(abs(a)), [sqrt(2) 2;3 4;5 6]);
assert_checkequal(full(abs(a+a)), 2.*[sqrt(2) 2;3 4;5 6]);

//real
a=[1 2;-3 4;5 -6];
assert_checkequal(real(a), a);
assert_checkequal(real(a+0), a);
assert_checkequal(real([]), []);
a=[]; assert_checkequal(real(a), []);

a=[1+%i 2;-3 4;5 -6];
assert_checkequal(real(a), [1 2;-3 4;5 -6]);
assert_checkequal(real(a+0), [1 2;-3 4;5 -6]);

a=[1 2;-3 4;5 -6]+%s;
assert_checkequal(real(a), a);
assert_checkequal(real(a+0), a);

a=[1+%i 2;-3 4;5 -6]+%s;
assert_checkequal(real(a), [1 2;-3 4;5 -6]+%s);
assert_checkequal(real(a+0), [1 2;-3 4;5 -6]+%s);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(real(a), a);
assert_checkequal(real(a+a), 2*a);
a=sparse([1+%i 2;-3 4;5 -6]);
assert_checkequal(full(real(a)), [1 2;-3 4;5 -6]);
assert_checkequal(full(real(a+a)), 2.*[1 2;-3 4;5 -6]);

//imag
a=[1 2;-3 4;5 -6];
assert_checkequal(imag(a), 0*a);
assert_checkequal(imag(a+0), 0*a);
assert_checkequal(imag([]), []);
a=[]; assert_checkequal(imag(a), []);
a=[1+%i 2;-3 4;5 -6];
assert_checkequal(imag(a), [1 0;0 0; 0 0]);
assert_checkequal(imag(a+0), [1 0;0 0; 0 0]);

a=[1 2;-3 4;5 -6]+%s;
assert_checkequal(imag(a), 0*a);
assert_checkequal(imag(a+0), 0*a);

a=[1+%i 2;-3 4;5 -6]+%s;
assert_checkequal(imag(a), [poly(1,"s","c") 0;0 0;0 0]);
assert_checkequal(imag(a+0), [poly(1,"s","c") 0;0 0;0 0]);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(imag(a), 0*a);
assert_checkequal(imag(a+a), 0*a);
a=sparse([1+%i 2;-3 4;5 -6]);
assert_checkequal(full(imag(a)), [1 0;0 0;0 0]);
assert_checkequal(full(imag(a+a)), 2*[1 0;0 0;0 0]);

//conj
a=[1 2;-3 4;5 -6];
assert_checkequal(conj(a), a);
assert_checkequal(conj(a+0), a);
assert_checkequal(conj([]), []);
a=[]; assert_checkequal(conj(a), []);
a=[1+%i 2;-3 4;5 -6];
assert_checkequal(conj(a), [1-%i 2;-3 4;5 -6]);
assert_checkequal(conj(a+0), [1-%i 2;-3 4;5 -6]);

a=[1 2;-3 4;5 -6]+%s;
assert_checkequal(conj(a), a);
assert_checkequal(conj(a+0), a);
a=[1+%i 2;-3 4;5 -6]+%s;
assert_checkequal(conj(a), [1-%i 2;-3 4;5 -6]+%s);
assert_checkequal(conj(a+0), [1-%i 2;-3 4;5 -6]+%s);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(conj(a), a);
assert_checkequal(conj(a+a), 2*a);
a=sparse([1+%i 2;-3 4;5 -6]);
assert_checkequal(full(conj(a)), [1-%i 2;-3 4;5 -6]);
assert_checkequal(full(conj(a+a)), 2*[1-%i 2;-3 4;5 -6]);

//int
a=[1.2 2.5;-3.4 4.5;5.8 -6.2];
assert_checkequal(int(a), [1 2;-3 4;5 -6]);
assert_checkequal(int(a+0), [1 2;-3 4;5 -6]);

a=[1.2+2.5*%i 2.5;-3.4 4.5;5.8 -6.2];
assert_checkequal(int(a), [1+2*%i 2;-3 4;5 -6]);
assert_checkequal(int(a+0), [1+2*%i 2;-3 4;5 -6]);

a=[1.2 2.5;-3.4 4.5;5.8 -6.2]+1.1*%s;
assert_checkequal(int(a), [1 2;-3 4;5 -6]+%s);
assert_checkequal(int(a+0), [1 2;-3 4;5 -6]+%s);

a=[1.2+2.5*%i 2.5;-3.4 4.5;5.8 -6.2]+1.1*%s;
assert_checkequal(int(a), [1+2*%i 2;-3 4;5 -6]+%s);
assert_checkequal(int(a+0), [1+2*%i 2;-3 4;5 -6]+%s);

assert_checkequal(int([]), []);
a = []; assert_checkequal(int(a), []);

//round
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkequal(round(a), [1 3;-3 5;6 -6]);
assert_checkequal(round(a+0), [1 3;-3 5;6 -6]);

a=[1.2+2.51*%i 2.52;-3.4 4.52;5.8 -6.2];
assert_checkequal(round(a), [1+3*%i 3;-3 5;6 -6]);
assert_checkequal(round(a+0), [1+3*%i 3;-3 5;6 -6]);

a=[1.2 2.51;-3.4 4.52;5.8 -6.2]+1.1*%s;
assert_checkequal(round(a), [1 3;-3 5;6 -6]+%s);
assert_checkequal(round(a+0), [1 3;-3 5;6 -6]+%s);

a=[1.2+2.51*%i 2.52;-3.4 4.52;5.8 -6.2]+1.1*%s;
assert_checkequal(round(a), [1+3*%i 3;-3 5;6 -6]+%s);
assert_checkequal(round(a+0), [1+3*%i 3;-3 5;6 -6]+%s);

assert_checkequal(round([]), []);
a=[]; assert_checkequal(round(a), []);

//ceil
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkequal(ceil(a), [2 3;-3 5;6 -6]);
assert_checkequal(ceil(a+0), [2 3;-3 5;6 -6]);

a=[1.2+2.51*%i 2.52;-3.4 4.52;5.8 -6.2];
assert_checkequal(ceil(a), [2+3*%i 3;-3 5;6 -6]);
assert_checkequal(ceil(a+0), [2+3*%i 3;-3 5;6 -6]);

a=[1.2 2.51;-3.4 4.52;5.8 -6.2]+1.1*%s;
assert_checkequal(ceil(a), [2 3;-3 5;6 -6]+2*%s);
assert_checkequal(ceil(a+0), [2 3;-3 5;6 -6]+2*%s);

a=[1.2+2.51*%i 2.52;-3.4 4.52;5.8 -6.2]+1.1*%s;
assert_checkequal(ceil(a), [2+3*%i 3;-3 5;6 -6]+2*%s);
assert_checkequal(ceil(a+0), [2+3*%i 3;-3 5;6 -6]+2*%s);

assert_checkequal(ceil([]), []);
a=[];assert_checkequal(ceil(a), []);

//floor
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkequal(floor(a), [1 2;-4 4;5 -7]);
assert_checkequal(floor(a+0), [1 2;-4 4;5 -7]);

a=[1.2+2.51*%i 2.52;-3.4 4.52;5.8 -6.2];
assert_checkequal(floor(a), [1+2*%i 2;-4 4;5 -7]);
assert_checkequal(floor(a+0), [1+2*%i 2;-4 4;5 -7]);

a=[1.2 2.51;-3.4 4.52;5.8 -6.2]+1.1*%s;
assert_checkequal(floor(a), [1 2;-4 4;5 -7]+%s);
assert_checkequal(floor(a+0), [1 2;-4 4;5 -7]+%s);

a=[1.2+2.51*%i 2.52;-3.4 4.52;5.8 -6.2]+1.1*%s;
assert_checkequal(floor(a), [1+2*%i 2;-4 4;5 -7]+%s);
assert_checkequal(floor(a+0), [1+2*%i 2;-4 4;5 -7]+%s);

assert_checkequal(floor([]), []);
a=[]; assert_checkequal(floor(a), []);

//sign
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkequal(sign(a), [1 1;-1 1;1 -1]);
a=[1+%i 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(sign(a)-[sqrt(2)/2*(1+%i) 1;-1 1;1 -1])>10*%eps);
assert_checkequal(sign([]), []);
a=[]; assert_checkequal(sign(a), []);

//log and exp
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(exp(log(a))-a)>10*%eps);
assert_checkfalse(norm(exp(log(a+0))-a)>10*%eps);

b=log(a);
assert_checkfalse(norm(exp(b)-a)>10*%eps);

a=[1+%i 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(exp(log(a))-a)>10*%eps);
assert_checkfalse(norm(exp(log(a+0))-a)>10*%eps);

b=log(a);
assert_checkfalse(norm(exp(b)-a)>10*%eps);

assert_checkequal(exp([]), []);
a=[]; assert_checkequal(exp(a), []);
assert_checkequal(log([]), []);
a=[]; assert_checkequal(log(a), []);

//sin and cos
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(sin(a).^2+cos(a).^2-1)>10*%eps);
assert_checkfalse(norm(sin(a+0).^2+cos(a+0).^2-1)>10*%eps);

a=[1+%i 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(sin(a).^2+cos(a).^2-1)>10*%eps);
assert_checkfalse(norm(sin(a+0).^2+cos(a+0).^2-1)>10*%eps);

assert_checkequal(cos([]), []);
a=[]; assert_checkequal(cos(a), []);
assert_checkequal(sin([]), []);
a=[]; assert_checkequal(sin(a), []);

//tan et atan
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(tan(atan(a))-a)>100*%eps);
assert_checkfalse(norm(tan(atan(a+0))-a)>100*%eps);

b=log(a); assert_checkfalse(norm(exp(b)-a)>100*%eps);

a=[1+%i 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(tan(atan(a))-a)>100*%eps);
assert_checkfalse(norm(tan(atan(a+0))-a)>100*%eps);

assert_checkequal(atan([]), []);
a=[]; assert_checkequal(atan(a), []);

assert_checkequal(atan([], []), []);
a=[]; assert_checkequal(atan(a, []), []);
a=[]; assert_checkequal(atan(a,a), []);
a=[]; assert_checkequal(atan([], a), []);

//expm
a=[0 2;0 0];
assert_checkfalse(norm(expm(a)-[1 2;0 1])>10*%eps);

a=[0 2*%i;0 0];
assert_checkfalse(norm(expm(a)-[1 2*%i;0 1])>10*%eps);

assert_checkequal(expm([]), []);
a=[]; assert_checkequal(expm(a), []);

//sqrt
a=[1.2 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(sqrt(a).^2-a)>100*%eps);
assert_checkfalse(norm(sqrt(a+0).^2-a)>100*%eps);

a=[1+%i 2.51;-3.4 4.52;5.8 -6.2];
assert_checkfalse(norm(sqrt(a).^2-a)>100*%eps);
assert_checkfalse(norm(sqrt(a+0).^2-a)>100*%eps);

assert_checkequal(sqrt([]), []);
a=[]; assert_checkequal(sqrt(a), a);

//sum
a=[1 2;-3 4;5 -6];
assert_checkequal(sum(a), 3);
assert_checkequal(sum(a+0), 3);
assert_checkequal(sum(a, 1), [3 0]);
assert_checkequal(sum(a+0, 1), [3 0]);

n=1;
assert_checkequal(sum(a, n), [3 0]);
assert_checkequal(sum(a+0, n), [3 0]);
assert_checkequal(sum(a, "r"), [3 0]);
assert_checkequal(sum(a+0, "r"), [3 0]);

n="r";
assert_checkequal(sum(a, n), [3 0]);
assert_checkequal(sum(a+0, n), [3 0]);


assert_checkequal(sum(a, 2), [3;1;-1]);
assert_checkequal(sum(a+0, 2), [3;1;-1]);

n=2;
assert_checkequal(sum(a,n), [3;1;-1]);
assert_checkequal(sum(a+0, n), [3;1;-1]);
assert_checkequal(sum(a, "c"), [3;1;-1]);
assert_checkequal(sum(a+0, "c"), [3;1;-1]);

n="c";
assert_checkequal(sum(a, n), [3;1;-1]);
assert_checkequal(sum(a+0, n), [3;1;-1]);

a=[1 2;-3 4;5 -6]+0*%i;
assert_checkequal(sum(a), 3+0*%i);
assert_checkequal(sum(a+0), 3+0*%i);
assert_checkequal(sum(a, 1), [3 0]+0*%i);
assert_checkequal(sum(a+0, 1), [3 0]+0*%i);

n=1;
assert_checkequal(sum(a,n), [3 0]+0*%i);
assert_checkequal(sum(a+0, n), [3 0]+0*%i);
assert_checkequal(sum(a, "r"), [3 0]+0*%i);
assert_checkequal(sum(a+0, "r"), [3 0]+0*%i);

n="r";
assert_checkequal(sum(a, n), [3 0]+0*%i);
assert_checkequal(sum(a+0, n), [3 0]+0*%i);

assert_checkequal(sum(a, 2), [3;1;-1]+0*%i);
assert_checkequal(sum(a+0, 2), [3;1;-1]+0*%i);

n=2;
assert_checkequal(sum(a,n), [3;1;-1]+0*%i);
assert_checkequal(sum(a+0,n), [3;1;-1]+0*%i);
assert_checkequal(sum(a,"c"), [3;1;-1]+0*%i);
assert_checkequal(sum(a+0, "c"), [3;1;-1]+0*%i);

n="c";
assert_checkequal(sum(a, n), [3;1;-1]+0*%i);
assert_checkequal(sum(a+0, n), [3;1;-1]+0*%i);

a=[];
assert_checkequal(sum(a), 0);
assert_checkequal(sum([]), 0);
assert_checkequal(sum(a, 1), []);
assert_checkequal(sum([], 1), []);

n=1;
assert_checkequal(sum(a,n), []);
assert_checkequal(sum([], n), []);
assert_checkequal(sum(a, "r"), []);
assert_checkequal(sum([], "r"), []);

n="r";
assert_checkequal(sum(a, n), []);
assert_checkequal(sum([], n), []);

assert_checkequal(sum(a, 2), []);
assert_checkequal(sum([], 2), []);

n=2;
assert_checkequal(sum(a,n), []);
assert_checkequal(sum([], n), []);
assert_checkequal(sum(a, "c"), []);
assert_checkequal(sum([], "c"), []);

n="c";
assert_checkequal(sum(a,n), []);
assert_checkequal(sum([], n), []);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(sum(a), 3);
assert_checkequal(sum(a+0*a), 3);

a=sparse([1 2;-3 4;5 -6]+0*%i);
assert_checkequal(sum(a), 3+0*%i);
assert_checkequal(sum(a+0*a), 3+0*%i);


//prod
a=[1 2;-3 4;5 -6];
assert_checkequal(prod(a), 720);
assert_checkequal(prod(a+0), 720);
assert_checkequal(prod(a, 1), [-15 -48]);
assert_checkequal(prod(a+0, 1), [-15 -48]);

n=1;
assert_checkequal(prod(a, n), [-15 -48]);
assert_checkequal(prod(a+0, n), [-15 -48]);
assert_checkequal(prod(a, "r"), [-15 -48]);
assert_checkequal(prod(a+0, "r"), [-15 -48]);

n="r";
assert_checkequal(prod(a, n), [-15 -48]);
assert_checkequal(prod(a+0, n), [-15 -48]);

assert_checkequal(prod(a, 2), [2;-12;-30]);
assert_checkequal(prod(a+0, 2), [2;-12;-30]);

n=2;
assert_checkequal(prod(a, n), [2;-12;-30]);
assert_checkequal(prod(a+0, n), [2;-12;-30]);
assert_checkequal(prod(a, "c"), [2;-12;-30]);
assert_checkequal(prod(a, "c"), [2;-12;-30]);

n="c";
assert_checkequal(prod(a, n), [2;-12;-30]);
assert_checkequal(prod(a+0, n), [2;-12;-30]);

a=[1 2;-3 4;5 -6]+0*%i;
assert_checkequal(prod(a), 720+0*%i);
assert_checkequal(prod(a+0), 720+0*%i);
assert_checkequal(prod(a, 1), [-15 -48]+0*%i);
assert_checkequal(prod(a+0, 1), [-15 -48]+0*%i);

n=1;
assert_checkequal(prod(a, n), [-15 -48]+0*%i);
assert_checkequal(prod(a+0, n), [-15 -48]+0*%i);
assert_checkequal(prod(a, "r"), [-15 -48]+0*%i);
assert_checkequal(prod(a+0, "r"), [-15 -48]+0*%i);

n="r";
assert_checkequal(prod(a, n), [-15 -48]+0*%i);
assert_checkequal(prod(a+0, n), [-15 -48]+0*%i);

assert_checkequal(prod(a, 2), [2;-12;-30]+0*%i);
assert_checkequal(prod(a+0, 2), [2;-12;-30]+0*%i);

n=2;
assert_checkequal(prod(a, n), [2;-12;-30]+0*%i);
assert_checkequal(prod(a+0, n), [2;-12;-30]+0*%i);
assert_checkequal(prod(a, "c"), [2;-12;-30]+0*%i);
assert_checkequal(prod(a+0, "c"), [2;-12;-30]+0*%i);

n="c";
assert_checkequal(prod(a, n), [2;-12;-30]+0*%i);
assert_checkequal(prod(a+0, n), [2;-12;-30]+0*%i);

a=[];
assert_checkequal(prod(a), 1);
assert_checkequal(prod([]), 1);
assert_checkequal(prod(a, 1), []);
assert_checkequal(prod([], 1), []);

n=1;
assert_checkequal(prod(a, n), []);
assert_checkequal(prod([], n), []);
assert_checkequal(prod(a, "r"), []);
assert_checkequal(prod([], "r"), []);

n="r";
assert_checkequal(prod(a,n), []);
assert_checkequal(prod([], n), []);

assert_checkequal(prod(a, 2), []);
assert_checkequal(prod([], 2), []);

n=2;
assert_checkequal(prod(a,n), []);
assert_checkequal(prod([], n), []);
assert_checkequal(prod(a, "c"), []);
assert_checkequal(prod([], "c"), []);

n="c";
assert_checkequal(prod(a, n), []);
assert_checkequal(prod([], n), []);

//cumsum
a=[1 2;-3 4;5 -6];
assert_checkequal(cumsum(a), [1,5;-2,9;3,3]);
assert_checkequal(cumsum(a+0), [1,5;-2,9;3,3]);
assert_checkequal(cumsum(a,1), [1,2;-2,6;3 0]);
assert_checkequal(cumsum(a+0,1), [1,2;-2,6;3 0]);

n=1;
assert_checkequal(cumsum(a, n), [1,2;-2,6;3 0]);
assert_checkequal(cumsum(a+0, n), [1,2;-2,6;3 0]);
assert_checkequal(cumsum(a, "r"), [1,2;-2,6;3 0]);
assert_checkequal(cumsum(a+0, "r"), [1,2;-2,6;3 0]);

n="r";
assert_checkequal(cumsum(a, n), [1,2;-2,6;3 0]);
assert_checkequal(cumsum(a+0, n), [1,2;-2,6;3 0]);

assert_checkequal(cumsum(a, 2), [1,3;-3,1;5,-1]);
assert_checkequal(cumsum(a+0, 2), [1,3;-3,1;5,-1]);

n=2;
assert_checkequal(cumsum(a, n), [1,3;-3,1;5,-1]);
assert_checkequal(cumsum(a+0, n), [1,3;-3,1;5,-1]);
assert_checkequal(cumsum(a, "c"), [1,3;-3,1;5,-1]);
assert_checkequal(cumsum(a+0, "c"), [1,3;-3,1;5,-1]);

n="c";
assert_checkequal(cumsum(a, n), [1,3;-3,1;5,-1]);
assert_checkequal(cumsum(a+0, n), [1,3;-3,1;5,-1]);

a=[1 2;-3 4;5 -6]+0*%i;
assert_checkequal(cumsum(a), [1,5;-2,9;3,3]+0*%i);
assert_checkequal(cumsum(a+0), [1,5;-2,9;3,3]+0*%i);
assert_checkequal(cumsum(a,1), [1,2;-2,6;3 0]+0*%i);
assert_checkequal(cumsum(a+0, 1), [1,2;-2,6;3 0]+0*%i);

n=1;
assert_checkequal(cumsum(a, n), [1,2;-2,6;3 0]+0*%i);
assert_checkequal(cumsum(a+0, n), [1,2;-2,6;3 0]+0*%i);
assert_checkequal(cumsum(a, "r"), [1,2;-2,6;3 0]+0*%i);
assert_checkequal(cumsum(a+0, "r"), [1,2;-2,6;3 0]+0*%i);

n="r";
assert_checkequal(cumsum(a, n), [1,2;-2,6;3 0]+0*%i);
assert_checkequal(cumsum(a+0, n), [1,2;-2,6;3 0]+0*%i);

assert_checkequal(cumsum(a, 2), [1,3;-3,1;5,-1]+0*%i);
assert_checkequal(cumsum(a+0, 2), [1,3;-3,1;5,-1]+0*%i);

n=2;
assert_checkequal(cumsum(a, n), [1,3;-3,1;5,-1]+0*%i);
assert_checkequal(cumsum(a+0, n), [1,3;-3,1;5,-1]+0*%i);
assert_checkequal(cumsum(a, "c"), [1,3;-3,1;5,-1]+0*%i);
assert_checkequal(cumsum(a+0, "c"), [1,3;-3,1;5,-1]+0*%i);

n="c";
assert_checkequal(cumsum(a, n), [1,3;-3,1;5,-1]+0*%i);
assert_checkequal(cumsum(a+0, n), [1,3;-3,1;5,-1]+0*%i);

a=[];
assert_checkequal(cumsum(a), []);
assert_checkequal(cumsum([]), []);
assert_checkequal(cumsum(a, 1), []);
assert_checkequal(cumsum([], 1), []);

n=1;
assert_checkequal(cumsum(a,n), []);
assert_checkequal(cumsum([], n), []);
assert_checkequal(cumsum(a, "r"), []);
assert_checkequal(cumsum([], "r"), []);

n="r";
assert_checkequal(cumsum(a, n), []);
assert_checkequal(cumsum([], n), []);

assert_checkequal(cumsum(a, 2), []);
assert_checkequal(cumsum([], 2), []);

n=2;
assert_checkequal(cumsum(a, n), []);
assert_checkequal(cumsum([], n), []);
assert_checkequal(cumsum(a, "c"), []);
assert_checkequal(cumsum([], "c"), []);

n="c";
assert_checkequal(cumsum(a,n), []);
assert_checkequal(cumsum([], n), []);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(cumsum(a), sparse([1,5;-2,9;3,3]));
assert_checkequal(cumsum(a+0*a), sparse([1,5;-2,9;3,3]));
a=sparse([1 2;-3 4;5 -6]+0*%i);
assert_checkequal(cumsum(a), sparse([1,5;-2,9;3,3]));
assert_checkequal(cumsum(a+0*a), sparse([1,5;-2,9;3,3]));

//cumprod
a=[1 2;-3 4;5 -6];
assert_checkequal(cumprod(a), [1 -30;-3 -120;-15 720]);
assert_checkequal(cumprod(a+0), [1 -30;-3 -120;-15 720]);
assert_checkequal(cumprod(a, 1), [1 2;-3 8;-15 -48]);
assert_checkequal(cumprod(a+0, 1), [1 2;-3 8;-15 -48]);

n=1;
assert_checkequal(cumprod(a,n), [1 2;-3 8;-15 -48]);
assert_checkequal(cumprod(a+0, n), [1 2;-3 8;-15 -48]);
assert_checkequal(cumprod(a, "r"), [1 2;-3 8;-15 -48]);
assert_checkequal(cumprod(a+0, "r"), [1 2;-3 8;-15 -48]);

n="r";
assert_checkequal(cumprod(a, n), [1 2;-3 8;-15 -48]);
assert_checkequal(cumprod(a+0, n), [1 2;-3 8;-15 -48]);

assert_checkequal(cumprod(a,2), [1 2;-3 -12;5 -30]);
assert_checkequal(cumprod(a+0, 2), [1 2;-3 -12;5 -30]);

n=2;
assert_checkequal(cumprod(a,n), [1 2;-3 -12;5 -30]);
assert_checkequal(cumprod(a+0, n), [1 2;-3 -12;5 -30]);
assert_checkequal(cumprod(a, "c"), [1 2;-3 -12;5 -30]);
assert_checkequal(cumprod(a+0, "c"), [1 2;-3 -12;5 -30]);

n="c";
assert_checkequal(cumprod(a,n), [1 2;-3 -12;5 -30]);
assert_checkequal(cumprod(a+0, n), [1 2;-3 -12;5 -30]);

a=[1 2;-3 4;5 -6]+0*%i;
assert_checkequal(cumprod(a), [1 -30;-3 -120;-15 720]+0*%i);
assert_checkequal(cumprod(a+0), [1 -30;-3 -120;-15 720]+0*%i);
assert_checkequal(cumprod(a, 1), [1 2;-3 8;-15 -48]+0*%i);
assert_checkequal(cumprod(a+0, 1), [1 2;-3 8;-15 -48]+0*%i);

n=1;
assert_checkequal(cumprod(a,n), [1 2;-3 8;-15 -48]+0*%i);
assert_checkequal(cumprod(a+0, n), [1 2;-3 8;-15 -48]+0*%i);
assert_checkequal(cumprod(a, "r"), [1 2;-3 8;-15 -48]+0*%i);
assert_checkequal(cumprod(a+0, "r"), [1 2;-3 8;-15 -48]+0*%i);

n="r";
assert_checkequal(cumprod(a, n), [1 2;-3 8;-15 -48]+0*%i);
assert_checkequal(cumprod(a+0, n), [1 2;-3 8;-15 -48]+0*%i);

assert_checkequal(cumprod(a, 2), [1 2;-3 -12;5 -30]+0*%i);
assert_checkequal(cumprod(a+0, 2), [1 2;-3 -12;5 -30]+0*%i);

n=2;
assert_checkequal(cumprod(a,n), [1 2;-3 -12;5 -30]+0*%i);
assert_checkequal(cumprod(a+0, n), [1 2;-3 -12;5 -30]+0*%i);
assert_checkequal(cumprod(a, "c"), [1 2;-3 -12;5 -30]+0*%i);
assert_checkequal(cumprod(a+0, "c"), [1 2;-3 -12;5 -30]+0*%i);

n="c";
assert_checkequal(cumprod(a, n), [1 2;-3 -12;5 -30]+0*%i);
assert_checkequal(cumprod(a+0, n), [1 2;-3 -12;5 -30]+0*%i);

a=[];
assert_checkequal(cumprod(a), []);
assert_checkequal(cumprod([]), []);
assert_checkequal(cumprod(a, 1), []);
assert_checkequal(cumprod([], 1), []);

n=1;
assert_checkequal(cumprod(a,n), []);
assert_checkequal(cumprod([], n), []);
assert_checkequal(cumprod(a, "r"), []);
assert_checkequal(cumprod([], "r"), []);

n="r";
assert_checkequal(cumprod(a,n), []);
assert_checkequal(cumprod([], n), []);

assert_checkequal(cumprod(a,2), []);
assert_checkequal(cumprod([], 2), []);

n=2;
assert_checkequal(cumprod(a,n), []);
assert_checkequal(cumprod([], n), []);
assert_checkequal(cumprod(a, "c"), []);
assert_checkequal(cumprod([], "c"), []);

n="c";
assert_checkequal(cumprod(a,n), []);
assert_checkequal(cumprod([], n), []);


a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(cumprod(a), sparse([1 -30;-3 -120;-15 720]));
assert_checkequal(cumprod(a+0*a), sparse([1 -30;-3 -120;-15 720]));

a=sparse([1 2;-3 4;5 -6]+0*%i);
assert_checkequal(cumprod(a), sparse([1 -30;-3 -120;-15 720]+0*%i));
assert_checkequal(cumprod(a+0*a), sparse([1 -30;-3 -120;-15 720]+0*%i));

//maxi
a=[1 2;-3 4;5 -6];
assert_checkequal(max(a), 5);
assert_checkequal(max(a+0), 5);
assert_checkequal(max(a, "r"), [5 4]);
assert_checkequal(max(a+0, "r"), [5 4]);

n="r";
assert_checkequal(max(a,n), [5 4]);
assert_checkequal(max(a+0, n), [5 4]);

assert_checkequal(max(a, "c"), [2;4;5]);
assert_checkequal(max(a+0, "c"), [2;4;5]);

n="c";
assert_checkequal(max(a, n), [2;4;5]);
assert_checkequal(max(a+0, n), [2;4;5]);

a=[1 2;-3 4;5 -6]+0*%i;
//if max(a)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end
//if max(a+0)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end
//if or(max(a,'r')<>[5 4]+0*%i) then pause,end
//if or(max(a+0,'r')<>[5 4]+0*%i) then pause,end
//n='r';
//if or(max(a,n)<>[5 4]+0*%i) then pause,end
//if or(max(a+0,n)<>[5 4]+0*%i) then pause,end

//if or(max(a,'c')<>[2;4;5]+0*%i) then pause,end
//if or(max(a+0,'c')<>[2;4;5]+0*%i) then pause,end
//n='c';
//if or(max(a,n)<>[2;4;5]+0*%i) then pause,end
//if or(max(a+0,n)<>[2;4;5]+0*%i) then pause,end

a=[];
assert_checkequal(max(a), []);
assert_checkequal(max([]), []);

assert_checkequal(max(a, "r"), []);
assert_checkequal(max([], "r"), []);

n="r";
assert_checkequal(max(a,n), []);
assert_checkequal(max([], n), []);

assert_checkequal(max(a, "c"), []);
assert_checkequal(max([], "c"), []);

n="c";
assert_checkequal(max(a,n), []);
assert_checkequal(max([], n), []);

a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(max(a), 5);
assert_checkequal(max(a+0*a), 5);

a=sparse([1 2;-3 4;5 -6]+0*%i);
//if max(a)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end
//if max(a+0*a)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end


//mini
a=[1 2;-3 4;5 -6];
assert_checkequal(min(a), -6);
assert_checkequal(min(a+0), -6);
assert_checkequal(min(a, "r"), [-3 -6]);
assert_checkequal(min(a+0, "r"), [-3 -6]);

n="r";
assert_checkequal(min(a,n), [-3 -6]);
assert_checkequal(min(a+0, n), [-3 -6]);

assert_checkequal(min(a, "c"), [1;-3;-6]);
assert_checkequal(min(a+0, "c"), [1;-3;-6]);

n="c";
assert_checkequal(min(a,n), [1;-3;-6]);
assert_checkequal(min(a+0,n), [1;-3;-6]);

//a=[1 2;-3 4;5 -6]+0*%i;
//if min(a)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end
//if min(a+0)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end
//if or(min(a,'r')<>[-3 -6]+0*%i) then pause,end
//if or(min(a+0,'r')<>[-3 -6]+0*%i) then pause,end
//n='r';
//if or(min(a,n)<>[-3 -6]+0*%i) then pause,end
//if or(min(a+0,n)<>[-3 -6]+0*%i) then pause,end

//if or(min(a,'c')<>[1;-3;-6]+0*%i) then pause,end
//if or(min(a+0,'c')<>[1;-3;-6]+0*%i) then pause,end
//n='c';
//if or(min(a,n)<>[1;-3;-6]+0*%i) then pause,end
//if or(min(a+0,n)<>[1;-3;-6]+0*%i) then pause,end

a=[];
assert_checkequal(min(a), []);
assert_checkequal(min([]), []);
assert_checkequal(min(a, "r"), []);
assert_checkequal(min([], "r"), []);

n="r";
assert_checkequal(min(a, n), []);
assert_checkequal(min([], n), []);
assert_checkequal(min(a, "c"), []);
assert_checkequal(min([], "c"), []);

n="c";
assert_checkequal(min(a, n), []);
assert_checkequal(min([], n), []);


a=sparse([1 2;-3 4;5 -6]);
assert_checkequal(min(a), -6);
assert_checkequal(min(a+0*a), -6);

a=sparse([1 2;-3 4;5 -6]+0*%i);
//if min(a)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end
//if min(a+0*a)<>[1 -30;-3 -120;-15 720]+0*%i then pause,end

//kron
a=[1 2];b=[3;4];
assert_checkequal(kron(a,b), [3 6;4 8]);
assert_checkequal(kron(a+0,b), [3 6;4 8]);
assert_checkequal(kron(a,b+0), [3 6;4 8]);
assert_checkequal(kron(a+0,b+0), [3 6;4 8]);
assert_checkequal(kron([], b), []);
assert_checkequal(kron([], b+0), []);

a=[];
assert_checkequal(kron(a,b), []);
assert_checkequal(kron(a,b+0), []);

a=[1 2];b=[];
assert_checkequal(kron(a,b), []);
assert_checkequal(kron(a+0,b), []);
assert_checkequal(kron(a,[]), []);
assert_checkequal(kron(a+0, []), []);

a=[];b=[];
assert_checkequal(kron(a,b), []);
assert_checkequal(kron(a,[]), []);
assert_checkequal(kron([], b), []);
assert_checkequal(kron([], []), []);

//matrix
a=[1 2 3 4 5 6];
n=1;m=6;
assert_checkequal(matrix(a,1,6), a);
assert_checkequal(matrix(a,n,6), a);
assert_checkequal(matrix(a,1,m), a);
assert_checkequal(matrix(a,n,m), a);
assert_checkequal(matrix(a+0,1,6), a);
assert_checkequal(matrix(a+0,n,6), a);
assert_checkequal(matrix(a+0,1,m), a);
assert_checkequal(matrix(a+0,n,m), a);

n=3;m=2; b=[1 4;2 5;3 6];
assert_checkequal(matrix(a,3,2), b);
assert_checkequal(matrix(a,n,2), b);
assert_checkequal(matrix(a,3,m), b);
assert_checkequal(matrix(a,n,m), b);
assert_checkequal(matrix(a+0,3,2), b);
assert_checkequal(matrix(a+0,n,2), b);
assert_checkequal(matrix(a+0,3,m), b);
assert_checkequal(matrix(a+0,n,m), b);

a=[1+%i 2 3 4 5 6];
n=1;m=6;
assert_checkequal(matrix(a,1,6), a);
assert_checkequal(matrix(a,n,6), a);
assert_checkequal(matrix(a,1,m), a);
assert_checkequal(matrix(a,n,m), a);
assert_checkequal(matrix(a+0,1,6), a);
assert_checkequal(matrix(a+0,n,6), a);
assert_checkequal(matrix(a+0,1,m), a);
assert_checkequal(matrix(a+0,n,m), a);

n=3;m=2; b=[1+%i 4;2 5;3 6];
assert_checkequal(matrix(a,3,2), b);
assert_checkequal(matrix(a,n,2), b);
assert_checkequal(matrix(a,3,m), b);
assert_checkequal(matrix(a,n,m), b);
assert_checkequal(matrix(a+0,3,2), b);
assert_checkequal(matrix(a+0,n,2), b);
assert_checkequal(matrix(a+0,3,m), b);
assert_checkequal(matrix(a+0,n,m), b);

a=string([1 2 3 4 5 6]);n=1;m=6;
assert_checkequal(matrix(a,1,6), a);
assert_checkequal(matrix(a,n,6), a);
assert_checkequal(matrix(a,1,m), a);
assert_checkequal(matrix(a,n,m), a);
assert_checkequal(matrix(a+a,1,6), a+a);
assert_checkequal(matrix(a+a,n,6), a+a);
assert_checkequal(matrix(a+a,1,m), a+a);
assert_checkequal(matrix(a+a,n,m), a+a);

n=3;m=2; b=string([1 4;2 5;3 6]);
assert_checkequal(matrix(a,3,2), b);
assert_checkequal(matrix(a,n,2), b);
assert_checkequal(matrix(a,3,m), b);
assert_checkequal(matrix(a,n,m), b);
assert_checkequal(matrix(a+a,3,2), b+b);
assert_checkequal(matrix(a+a,n,2), b+b);
assert_checkequal(matrix(a+a,3,m), b+b);
assert_checkequal(matrix(a+a,n,m), b+b);

a=[1 2 3 4 5 6]+%s;
n=1;m=6;
assert_checkequal(matrix(a,1,6), a);
assert_checkequal(matrix(a,n,6), a);
assert_checkequal(matrix(a,1,m), a);
assert_checkequal(matrix(a,n,m), a);
assert_checkequal(matrix(a+0,1,6), a);
assert_checkequal(matrix(a+0,n,6), a);
assert_checkequal(matrix(a+0,1,m), a);
assert_checkequal(matrix(a+0,n,m), a);

n=3;m=2; b=[1 4;2 5;3 6]+%s;
assert_checkequal(matrix(a,3,2), b);
assert_checkequal(matrix(a,n,2), b);
assert_checkequal(matrix(a,3,m), b);
assert_checkequal(matrix(a,n,m), b);
assert_checkequal(matrix(a+0,3,2), b);
assert_checkequal(matrix(a+0,n,2), b);
assert_checkequal(matrix(a+0,3,m), b);
assert_checkequal(matrix(a+0,n,m), b);

a=[1+%i 2 3 4 5 6]+%s;
n=1;m=6;
assert_checkequal(matrix(a,1,6), a);
assert_checkequal(matrix(a,n,6), a);
assert_checkequal(matrix(a,1,m), a);
assert_checkequal(matrix(a,n,m), a);
assert_checkequal(matrix(a+0,1,6), a);
assert_checkequal(matrix(a+0,n,6), a);
assert_checkequal(matrix(a+0,1,m), a);
assert_checkequal(matrix(a+0,n,m), a);

n=3;m=2; b=[1+%i 4;2 5;3 6]+%s;
assert_checkequal(matrix(a,3,2), b);
assert_checkequal(matrix(a,n,2), b);
assert_checkequal(matrix(a,3,m), b);
assert_checkequal(matrix(a,n,m), b);
assert_checkequal(matrix(a+0,3,2), b);
assert_checkequal(matrix(a+0,n,2), b);
assert_checkequal(matrix(a+0,3,m), b);
assert_checkequal(matrix(a+0,n,m), b);

//clean
a=[1 1.d-12 1.d-5 2d8];
b=[1 0 0 2d8];
assert_checkequal(clean(a), b);
assert_checkequal(clean(a+0), b);

epsa=1.d-10;
assert_checkequal(clean(a,epsa), b);
assert_checkequal(clean(a+0, epsa), b);
assert_checkequal(clean(a, epsa+0), b);
assert_checkequal(clean(a+0, epsa+0), b);

epsr=1.d-5;b=[0 0 0 2d8];
assert_checkequal(clean(a,epsa,epsr), b);
assert_checkequal(clean(a+0,epsa,epsr), b);
assert_checkequal(clean(a,epsa+0,epsr), b);
assert_checkequal(clean(a,epsa,epsr+0), b);
assert_checkequal(clean(a+0,epsa+0,epsr), b);
assert_checkequal(clean(a+0,epsa,epsr+0), b);
assert_checkequal(clean(a,epsa+0,epsr+0), b);
assert_checkequal(clean(a+0,epsa+0,epsr+0), b);

a=[1+%i 1.d-12 1.d-5 2d8];
b=[1+%i 0 0 2d8];
assert_checkequal(clean(a), b);
assert_checkequal(clean(a+0), b);

epsa=1.d-10;
assert_checkequal(clean(a,epsa), b);
assert_checkequal(clean(a+0,epsa), b);
assert_checkequal(clean(a,epsa+0), b);
assert_checkequal(clean(a+0,epsa+0), b);

epsr=1.d-5;b=[0+0*%i 0 0 2d8];
assert_checkequal(clean(a,epsa,epsr), b);
assert_checkequal(clean(a+0,epsa,epsr), b);
assert_checkequal(clean(a,epsa+0,epsr), b);
assert_checkequal(clean(a,epsa,epsr+0), b);
assert_checkequal(clean(a+0,epsa+0,epsr), b);
assert_checkequal(clean(a+0,epsa,epsr+0), b);
assert_checkequal(clean(a,epsa+0,epsr+0), b);
assert_checkequal(clean(a+0,epsa+0,epsr+0), b);
