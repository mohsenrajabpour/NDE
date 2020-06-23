%--------Homework#12-----Problem 1----
clear all
clc

h=input('Please Enter the value of h = ')% h=0.1 & 0.05
k=0.004;

xspan=[0 1];
x=xspan(1):h:xspan(2);

tspan=[0 .5];
t=tspan(1):k:tspan(2);

M=length(x);
N=length(t);

U=zeros(M,N);

U(:,1)=sin(pi*x);%Initial condition
r=k/h^2;         %Eq (12.13)

g0=0;        %Boundary condition
g1=0;        %Boundary condition
U(1,:)=g0;   %Eq (12.4)
U(end,:)=g1; %Eq (12.4)

%Eq (12.12)
for n=1:N-1
    for m=2:M-1
        U(m,n+1) = r*U(m+1,n) + (1-2*r)*U(m,n) + r*U(m-1,n);
    end
end

%Finding the exact value of U
for n=1:N
    for m=1:M
        U_exact(m,n) = sin(pi*x(m))*exp(-pi^2*t(n));
    end
end

Error = (U - U_exact); %Error
max(Error(:,(end)))

figure(1201)
plot(x,Error(:,(end)))
grid on
title(['Heat Equation. h= ',num2str(h),'& k=', num2str(k)])
xlabel('T');ylabel('X');