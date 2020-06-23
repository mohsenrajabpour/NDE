%--------Homework#8-----Problem 9----- Shallow Solution

clear all
clc

h=input('Please enter the value of h =');
%%%   h=.1, .2

xspan=[0+h 2-h];
x=xspan(1):h:xspan(2);
C=input('Please enter the value of C =');
%%%C = 100, 20, 10, 1.5, 0.75, 0, -0.5, -0.9, -1, -1.5

alfa = 1;
beta = 1;
M = length(x);
a=1+zeros(1,M)';
b=-2-C*(h^2)+zeros(1,M)';%
c=a;

r = zeros(1,M);
Y = 1+zeros(1,M);
fun = @mohsen_hw8_p8_fun;

i=1;
myeps=1;

while myeps>= 1e-6
    
    Yold=Y;
    for n=1:length(x)
        r(n) =  (h^2)*(feval( fun,x(n),Yold(n))-C*Yold(n));%
    end
    
    r(1) = r(1)-alfa;
    r(end) = r(end)-beta;
    r=r';
    Y  = thomas(a,b,c,r);
    myeps=norm(Y - Yold,inf);
    m(i)=myeps;
    
    if i > 1000
        disp('Iterations do NOT converge !')
        break
    end
    i=i+1;
end

NUMBER_of_ITERATION =i-1
Y=[alfa Y beta];
x=0:h:2;


subplot(1,2,1)
plot(x,Y)
grid on

title(['Modified Picard Method. h= ',num2str(h),' & C= ', num2str(C)])
xlabel('x');ylabel('Solution');

subplot(1,2,2)
semilogy(m)
grid on
title('Error of the Modified Picard Method')
xlabel('Iteration');ylabel('Error');