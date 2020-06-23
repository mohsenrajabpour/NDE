%-------Homework #14--- Problem 2------
clear all
clc

h=0.02;
k=h/8;
xspan=[0 1];
x=xspan(1)+h:h:xspan(2)-h;

tspan=[0 .5];
t=tspan(1):k:tspan(2);

M=length(x);
N=length(t);

r=k/h^2;

U(1,:)=zeros(1,N);
U(M,:)=zeros(1,N);
U(:,1)=sin(pi*x);

%%% The explanation for deriving these equations and matrices is attached.
%%% The heat equation is expanded by equation (14.17)
for n=1:N-1
    for m=1:M
        
        a1(m,:) = (k/(4*h) - (r/2)*(1+(m+1)*h))* ones(M,1);
        b1(m,:) = (1 + r*(1+m*h) + (k/2)*((m*h)^2)/(1+(t(n+1))^2 )) * ones(M,1);
        c1(m,:) = (-k/(4*h) - (r/2)*(1+(m-1)*h))* ones(M,1);
        
        a2(m,:) = (-k/(4*h) + (r/2)*(1+(m+1)*h)) * ones(M,1);
        b2(m,:) = (1 - r*(1+m*h) - (k/2)*((m*h)^2)/(1+(t(n))^2 )) * ones(M,1);
        c2(m,:) = (k/(4*h) + (r/2)*(1+(m-1)*h)) * ones(M,1);
        
    end
    A = spdiags(a1,-1,M,M) + spdiags(b1,0,M,M) + spdiags(c1,1,M,M);
    
    B = spdiags(a2,-1,M,M) + spdiags(b2,0,M,M) + spdiags(c2,1,M,M);
    
    U(:,n+1) = A\(B*U(:,n));
end

U= [0; U(:,(end)); 0];
x=xspan(1):h:xspan(2);
figure(140201)
plot(x,U(:,(end)))
grid on
title(['IBVP, Crank–Nicolson scheme h= ', num2str(h),' & k= ', num2str(k)])
xlabel('X');ylabel('Solution');