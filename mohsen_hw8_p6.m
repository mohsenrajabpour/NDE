%--------Homework#8-----Problem 6-----

clear all
clc

h=input('Enter the value of step size (h)=')
% h= .025 & h= .05;
xspan=[0+h 1];
x=xspan(1):h:xspan(2);

A1 = 1;
A2 = 2;
alfa = 0;
beta = 2;
M = length(x);

c = 1 + zeros(1,M-1);
a=c;
a(end)=2;

z=zeros(1,M);

for i=1:length(x-1)
    b(i) = -(2-(h^2)*(-2/(1+x(i))^2)) + z(i) ;
end

b(length(x)) = (-2+h^2*(-2/(1+x(end))^2)-2*h*A1/A2)+z(length(x));

for i=1:length(x-1)
    R(i) = -4/(1+x(i))^2;
    r(i) = R(i)*h^2;
end

R(length(x)) = -4/(1+x(length(x)))^2;
r(length(x)) = (h^2)*R(length(x)) - (2*h*beta)/A2;

y = thomas(a,b,c,r);
% 
for i=1:length(x)
    Yexact(i)=2*x(i)/(1+x(i));
end

Error=abs(y-Yexact);
subplot(1,2,1)
plot(x,Yexact,'*r',x,y,'b')
grid on, title('Mixed boundry condition')
legend('Exact Solution','Numerical Solution','location','southeast')
xlabel('X');
ylabel('Solution');
subplot(1,2,2)
plot(x,Error)
grid on,title('Error of Mixed boundry condition')
xlabel('X');
ylabel('Error');