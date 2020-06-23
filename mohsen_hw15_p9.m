%-------Homework #15--- Problem 9------

clear all
clc

h=0.1;
k=0.025;

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
        U(m,l) = 10*sin(pi*x(m))*sin(pi*y(l)/yspan(2)) + sin(2*pi*y(l)/yspan(2))*(1-x(m)) ...
            + cos(2*pi*y(l)/yspan(2))*x(m);
    end
end

S1 = M-2;
a1 = -(r/2) * ones(S1,1);
b1 = (1+r)  * ones(S1,1);
c1 = a1;

A1 = spdiags(a1,-1,S1,S1) + spdiags(b1,0,S1,S1) + spdiags(c1,1,S1,S1);

S2 = L-2;
a2 = -(r/2) * ones(S2,1);
b2 = (1+r)  * ones(S2,1);
c2 = a2;

A2 = spdiags(a2,-1,S2,S2) + spdiags(b2,0,S2,S2) + spdiags(c2,1,S2,S2);

for n=1:N-1
    
    g(1,:) = sin(2*pi*y/yspan(2))*exp(-(2*pi/yspan(2))^2*t(n+1));
    g(M,:) = cos(2*pi*y/yspan(2))*exp(-(2*pi/yspan(2))^2*t(n+1));
    g(:,1) = (x*exp(-(2*pi/yspan(2))^2*t(n+1)))';
    g(:,L) = (x*exp(-(2*pi/yspan(2))^2*t(n+1)))';
    
    for l=2:L-1
        
        U_star(1,l) = 0.5*(U(1,l)+g(1,l)) + (r/4)*((U(1,l+1)-2*U(1,l)+U(1,l-1))-(g(1,l+1)-2*g(1,l)+g(1,l-1)));
        U_star(M,l) = 0.5*(U(M,l)+g(M,l)) + (r/4)*((U(M,l+1)-2*U(M,l)+U(M,l-1))-(g(M,l+1)-2*g(M,l)+g(M,l-1)));
        
        b_star(2,l)   = U_star(1,l);
        b_star(M-1,l) = U_star(M,l);
        
    end
    
    for l=2:L-1
        U_star(2:M-1,l) = A1\( U(2:M-1,l) + (r/2)*( U(2:M-1,l+1)-2*U(2:M-1,l)+U(2:M-1,l-1) )+(r/2)*b_star(2:M-1,l) );
    end
    
    U_star(:,L)=zeros(1,M);
    
    for m=2:M-1
        
        b(m,2) = g(m,1);
        b(m,L-1) = g(m,L);
        
    end
    
    for m=2:M-1
        U_new(m,2:L-1) = A2\(U_star(m,2:L-1)' + (r/2)*(U_star(m+1,2:L-1)'-2*U_star(m,2:L-1)' ...
            + U_star(m-1,2:L-1)')+(r/2)*b(m,2:L-1)');
    end
    U_new(1:M,1) = g(:,1);
    U_new(1:M,L) = g(:,L);
    U_new(1,1:L) = g(1,:);
    U_new(M,1:L) = g(M,:);
    
    U=U_new;
end

for m=1:M
    for l=1:L
        U_exact(m,l) = 10*sin(pi*x(m))*sin(pi*y(l)/yspan(2))*exp( -(1+1/(yspan(2))^2)*pi^2*tspan(2)) ...
            + (sin(2*pi*y(l)/yspan(2))*(1-x(m))+cos(2*pi*y(l)/yspan(2))*x(m))*exp(-(2*pi/yspan(2))^2*tspan(2));
    end
end

[X Y]=meshgrid(x,y);
Error=abs((U_exact-U_new))';
figure(1509)
mesh(X,Y, Error)
title(['Peaceman Rachford Method with Dirichlet Boundary Conditions h= ',num2str(h),' & k=', num2str(k)])
max(max(Error))
xlabel('X')
ylabel('Y')
zlabel('Error')