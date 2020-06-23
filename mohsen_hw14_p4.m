%-------Homework #14--- Problem 4------

clear all
clc

h=0.01; %%The value of h is specified by trial and error method to have 
        %%a reasonable error. If h=0.005, the error would be better (the
        %%half of the current result), but the process would be time consuming.
        %%In addition, I didn't choose h=0.005 as I was not sure if that 
        %%would be reasonable value for h, because that is to small.
k=h/4;
xspan=[-5 5];
x=xspan(1):h:xspan(2);

tspan=[0 3];
t=tspan(1):k:tspan(2);

M=length(x);
N=length(t);

r=k/h^2;
gamma=0.5;
U=zeros(M,N);
U(1,:)=zeros(1,N);
U(M,:)=2*ones(1,N);
U(:,1)=(4/pi)*atan(exp(7*x));

%%% The explanation for deriving these equations and matrices is attached.
%%% The heat equation is expanded by equations (14.47),(14.48),(14.49) and (14.50)   
n=1;

for m=2:M-1
    U(m,n+1) = U(m,n) + ( (1 - 0.5*(U(m+1,n)+U(m,n))) * (U(m+1,n)-U(m,n))/h - ...
        ( -1 + 0.5*(U(m,n)+U(m-1,n)) ) * (U(m,n)-U(m-1,n))/h )*k + ...
        gamma*r*(U(m+1,n)-2*U(m,n)+U(m-1,n));
end

x=xspan(1)+h:h:xspan(2)-h;

for n=2:N-1
    for m=1:M
        
        a1(m,:)   =  (1.5*U(m,n)-0.5*U(m,n-1)-1)*k/(4*h) - (gamma*r/2);
        b1(m,:)   =  (1 + gamma*r);
        c1(m+2,:) = -(1.5*U(m,n)-0.5*U(m,n-1)-1)*k/(4*h) - (gamma*r/2);
        
        a2(m,:)   = -(1.5*U(m,n)-0.5*U(m,n-1)-1)*k/(4*h) + (gamma*r/2);
        b2(m,:)   =  (1 - gamma*r);
        c2(m+2,:) =  (1.5*U(m,n)-0.5*U(m,n-1)-1)*k/(4*h) + (gamma*r/2);
        
    end
    
    A = spdiags(a1,-1,M,M) + spdiags(b1,0,M,M) + spdiags(c1,1,M,M);
    
    B = spdiags(a2,-1,M,M) + spdiags(b2,0,M,M) + spdiags(c2,1,M,M);
    
    b=zeros(M,1);
    b(end)= 2 * ( (1.5*U(end-1,n)-0.5*U(end-1,n-1)-1)*k/(2*h) + gamma*r );
    
    U(:,n+1) = A\(B*U(:,n)+b);
end

x=xspan(1):h:xspan(2);
U_exact = 1+ tanh(x/(2*gamma));

figure
plot(x, U(:,end),x,U_exact,'r')
grid on
title(['Nonlinear IBVP, h= ', num2str(h),' & k= ', num2str(k),' & gamma= ', num2str(gamma)])
legend('Numerical Solution','Exact Solution','Location','northwest')
xlabel('X');ylabel('Solution');

Error = U(:,end)'-U_exact;
figure
plot(x, Error)
grid on
title('Error')
xlabel('X');ylabel('Error');