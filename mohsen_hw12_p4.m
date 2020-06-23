%--------Homework#12-----Problem 4----

clear all
clc

h=0.1;
% k=input('Please Enter the value of k = ')%k=0.004 & 0.006
k=.004;
xspan=[0 1];
x=xspan(1):h:xspan(2);

tspan=[0 .46];
t=tspan(1):k:tspan(2);

M=length(x);
N=length(t);

U=zeros(M,N);

U(:,1) = sin(pi*x);%Initial condition
Ub(:,1)= sin(pi*x);
r=k/h^2;         %Eq (12.13)

g0=0;        %Boundary condition
g1=0;        %Boundary condition
U(1,:)=g0;   %Eq (12.4)
U(end,:)=g1; %Eq (12.4)


for n=1:N-1
    for m=2:M-1
        Ub(m,:)  =r*U(m+1,n)+(1-2*r)*U(m,n)  +r*U(m-1,n);
         if  m < M-1
        Ub(m+1,:)=r*U(m+2,n)+(1-2*r)*U(m+1,n)+r*U(m,n);
         end
        U(m,n+1) = U(m,n)+(r/2)*((U(m+1,n)-2*U(m,n)+U(m-1,n))+(Ub(m+1,:)-2*Ub(m,:)+Ub(m-1,:)));
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
% figure(1204)
 
% plot(Error(:,(end)))
% grid on
% title(['h= ',num2str(h),'& k=', num2str(k)])
% xlabel('T');ylabel('X');
