%-------Homework #15--- Problem 1------
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

U(1,:)=zeros(1,L);
U(M,:)=zeros(1,L);
U(:,1)=zeros(1,M);
U(:,L)=zeros(1,M);

for m=1:M
    for l=1:L
        U(m,l)=sin(pi*x(m))*sin(pi*y(l)/yspan(2));
    end
end

U_old=U;

for n=2:N
    for m=2:M-1
        for l=2:L-1
            U_new(m,l) = U_old(m,l) + r*(U_old(m+1,l)-2*U_old(m,l)+U_old(m-1,l)+ ...
                U_old(m,l+1)-2*U_old(m,l)+U_old(m,l-1));
        end
    end
    U_old(1:M-1,1:L-1) = U_new;
    U_old(M,:)=zeros(1,L);
    U_old(:,L)=zeros(1,M);
end

for m=1:M
    for l=1:L
        U_exact(m,l)=sin(pi*x(m))*sin(pi*y(l)/yspan(2))*exp(-(1+yspan(2)^-2)*pi^2*tspan(2));
    end
end

[X Y]=meshgrid(x,y);
Error=(U_exact-U_old)';
max(max(Error))
figure(1501)
mesh(X,Y, Error)
xlabel('X')
ylabel('Y')
zlabel('Error')