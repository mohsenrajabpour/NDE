%-------Homework #14--- Problem 1------
clear all
clc

h=0.02;
k=h/2;
xspan=[0 1];
x=xspan(1):h:xspan(2)-h;

tspan=[0 2];
t=tspan(1):k:tspan(2)-k;

M=length(x);
N=length(t);

r=k/h^2;

U(M,:)=zeros(1,N);
U(:,1)=sin(pi*x);
p=1;
q=pi;
%%%%%%%

a1 = -(r/2) * ones(M,1);
b1 = (1+r) * ones(M,1);
c1 = a1;

A = spdiags(a1,-1,M,M) + spdiags(b1,0,M,M) + spdiags(c1,1,M,M);
A(1,1)=1+r*(1-h*p);
A(1,2)=-r;
%%%%%%%%

a2 =  r/2 * ones(M,1);
b2 =(1-r) * ones(M,1);
c2 = a2;

B = spdiags(a2,-1,M,M) + spdiags(b2,0,M,M) + spdiags(c2,1,M,M);
B(1,1)=1-r*(1-h*p);
B(1,2)=r;
%%%%%%%%
b=zeros(1,M)';
b(1)=-r*h*(q+q);

for n=1:N-1
    U(:,n+1) = A\(B*U(:,n)+b);
end

UU=[U(:,end);0];
x=[xspan(1):h:xspan(2)];
figure(140101)
plot(x,UU)
grid on
title(['IBVP, Crank–Nicolson scheme h= ', num2str(h),' & k= ', num2str(k)])
xlabel('X');ylabel('Solution');

%%%Verifying that the solution satisfies the boundary condition at x=0, using
%%%the explanation in the hint, Equation (8.37). The equation for this
%%%problem will be simplified: u2-u0=2*pi*h. So these two value should be
%%%equal. More explanation is attached
U(3,1)-U(1,1)
2*h*pi

%%%Verifying that the solution satisfies the boundary condition at x=0, using
%%%equation (14.5) and (14.7)
%%% The answer should be equal to pi=3.14

for n=1:N
    V(n)=U(2,n)-2*h*(q-p*U(1,n)); % U(-1,0) in equation (14.5)
    Y(1,n)=(U(2,n)-V(n))/(2*h)+p*U(1,n); % Equation(14.7)
end
figure(140102)
plot(t,Y)
title('Verifying that the solution satisfies the boundary condition at x=0')
grid on