%--------Homework#8-----Problem 2--MATLAB Solver -- A is a sparse matrix -----
clear all
clc

M=input('Enter the value of M=')
tic
for n=1:30 % this loop is just for getting better aproximation of computational time
a=-1+zeros(1,M)';
b=2+zeros(1,M)';
c=a;

r=1+zeros(1,M);

for i=1:M-1
   i=i+1;
   r(i)=r(i-1)*-1;
end
r=r';

A = spdiags(a,-1,M,M) + spdiags(b,0,M,M) + spdiags(c,1,M,M);

y=A\r;
end
toc
