%-------Homework #15--- Problem 2------
clear all
clc

h=0.1;
k=0.002;

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
        U_old(m,l) = 10*sin(pi*x(m))*sin(pi*y(l)/yspan(2)) + sin(2*pi*y(l)/yspan(2))*(1-x(m)) ...
            + cos(2*pi*y(l)/yspan(2))*x(m);
    end
end

U_old(1,:) = sin(2*pi*y/yspan(2))*exp(-(2*pi/yspan(2))^2*t(1));
U_old(M,:) = cos(2*pi*y/yspan(2))*exp(-(2*pi/yspan(2))^2*t(1));
U_old(:,1) = (x*exp(-(2*pi/yspan(2))^2*t(1)))';
U_old(:,L) = (x*exp(-(2*pi/yspan(2))^2*t(1)))';

for n=2:N
    
    for m=2:M-1
        for l=2:L-1
            U_new(m,l) = U_old(m,l) + r*(U_old(m+1,l)-2*U_old(m,l)+U_old(m-1,l)+ ...
                U_old(m,l+1)-2*U_old(m,l)+U_old(m,l-1));
        end
    end
    
    U_old(2:M-1,2:L-1) = U_new(2:M-1,2:L-1);
    
    U_old(1,:) = sin(2*pi*y/yspan(2))*exp(-(2*pi/yspan(2))^2*t(n));
    U_old(M,:) = cos(2*pi*y/yspan(2))*exp(-(2*pi/yspan(2))^2*t(n));
    U_old(:,1) = (x*exp(-(2*pi/yspan(2))^2*t(n)))';
    U_old(:,L) = (x*exp(-(2*pi/yspan(2))^2*t(n)))';
    
end

for m=1:M
    for l=1:L
        U_exact(m,l) = 10*sin(pi*x(m))*sin(pi*y(l)/yspan(2))*exp( -(1+1/(yspan(2))^2)*pi^2*tspan(2)) ...
            + (sin(2*pi*y(l)/yspan(2))*(1-x(m))+cos(2*pi*y(l)/yspan(2))*x(m))*exp(-(2*pi/yspan(2))^2*tspan(2));
    end
end

[X Y]=meshgrid(x,y);
Error=(U_exact-U_old)';
figure(1502)
mesh(X,Y, Error)
max(max(Error))
xlabel('X')
ylabel('Y')
zlabel('Error')