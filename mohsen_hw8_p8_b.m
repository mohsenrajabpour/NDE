%--------Homework#8-----Problem 8----- Deep Solution
clear all
clc


h=.2;%h=.1 & .2
xspan=[0+h 2-h];
x=xspan(1):h:xspan(2);

alfa = 1;
beta = 1;
M = length(x);
a=1+zeros(1,M)';
b=-2+zeros(1,M)';
c=a;

r = zeros(1,M);
Y = zeros(1,M);

for i=1: floor(M/2)
    Y (i)=1-16*x(i);
end
for i= floor(M/2)+1:M
    Y (i)=-31+16*x(i);
end

fun = @mohsen_hw8_p8_fun;

i=1;
myeps=1;

while myeps>= 1e-6
    
    Yold=Y;
    
    for n=1:length(x)
        r(n) =  h^2*feval( fun,x(n),Y(n));
    end
    
    r(1) = r(1)-alfa;
    r(end) = r(end)-beta;
    r=r';
    Y  = thomas(a,b,c,r);
    myeps=norm(Y - Yold,inf);
    m(i)=myeps;
    i=i+1;
end
NUMBER_of_ITERATION =i-1
Y=[alfa Y beta];
x=0:h:2;
subplot(1,2,1)
plot(x,Y)
grid on

title(['Picard Method. h= ',num2str(h)])
xlabel('x');ylabel('Solution');

subplot(1,2,2)
semilogy(m)
grid on
title('Error of Picard Method')
xlabel('Iteration');ylabel('Error');
