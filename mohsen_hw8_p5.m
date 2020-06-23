%--------Homework#8-----Problem 5-----
clear all
clc

h=input('Enter the value of step size (h)=')
%h=.09 & .01
xspan=[0+h 1.62-h];
x=xspan(1):h:xspan(2);

alfa = 1;
beta = -2.24;
M = length(x);

a = 1 + zeros(1,M-1);
b = -(2-(h^2)*(-30^2)) + zeros(1,M);
c=a;
r=1+zeros(1,M);
for i=1:length(x)
    R(i)=(30^2)*(2*x(i)-1);
    r(i)=R(i)*h^2;
end

r(1) = r(1) - 1*alfa;
r(end) = r(end) - 1*beta;


y = thomas(a,b,c,r);

Yexact=1-2*x;
Error=y-Yexact;
subplot(1,2,1)
plot(x,Yexact,'r',x,y,'*b')
grid on, title(['Discretized Solution. h= ',num2str(h)])
legend('Exact Solution','Numerical Solution','location','northeast')
xlabel('X');
ylabel('Solution');
subplot(1,2,2)
plot(x,Error)
grid on;title('Error of Discretized Solution')
xlabel('X');
ylabel('Error');