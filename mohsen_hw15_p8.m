%-------Homework #15--- Problem 8------

clear all
clc

h=0.1;
k=0.01;

xspan=[0 1];
x=xspan(1):h:xspan(2);

yspan=[0 2.5];
y=yspan(1):h:yspan(2);

tspan=[0 .5];
t=tspan(1):k:tspan(2);

M=length(x);
L=length(y);
N=length(t);

r=k/h^2;

for m=1:M
    for l=1:L
        U(m,l)=sin(pi*x(m))*sin(pi*y(l)/yspan(2));
    end
end

S1 = M-2;
a1 = -(r/2) * ones(S1,1);
b1 = (1+r) * ones(S1,1);
c1 = a1;

A1 = spdiags(a1,-1,S1,S1) + spdiags(b1,0,S1,S1) + spdiags(c1,1,S1,S1);

S2 = L-2;
a2 = -(r/2) * ones(S2,1);
b2 = (1+r) * ones(S2,1);
c2 = a2;

A2 = spdiags(a2,-1,S2,S2) + spdiags(b2,0,S2,S2) + spdiags(c2,1,S2,S2);

U(1,:)=zeros(1,L);
U(M,:)=zeros(1,L);
U(:,1)=zeros(1,M);
U(:,L)=zeros(1,M);

U_star(:,1) = zeros(1,M);
U_star(:,L) = zeros(1,M);

U_new(1,:)=zeros(1,L);
U_new(M,:)=zeros(1,L);
U_new(:,1)=zeros(1,M);
U_new(:,L)=zeros(1,M);

for n=2:N
    for l=2:L-1
        U_star(2:M-1,l) = A1\(U(2:M-1,l) + (r/2)*(U(2:M-1,l+1)-2*U(2:M-1,l)+U(2:M-1,l-1)));
    end
    
    for m=2:M-1
        U_new(m,2:L-1) = A2\(U_star(m,2:L-1)' + (r/2)*(U_star(m+1,2:L-1)'-2*U_star(m,2:L-1)' + U_star(m-1,2:L-1)'));
    end
    U=U_new;
end

for m=1:M
    for l=1:L
        U_exact(m,l)=sin(pi*x(m))*sin(pi*y(l)/yspan(2))*exp(-(1+yspan(2)^-2)*pi^2*tspan(2));
    end
end

[X Y]=meshgrid(x,y);
Error=((U_exact-U_new))';
max(max(Error))
figure(1508)
mesh(X,Y, Error)
title(['Peaceman Rachford Method with Zero Boundary Conditions h= ',num2str(h),' & k=', num2str(k)])
xlabel('X')
ylabel('Y')
zlabel('Error')