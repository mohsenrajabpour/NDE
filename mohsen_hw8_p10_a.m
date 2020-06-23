%--------Homework#8-----Problem 10-----Shallow Solution

clear all
clc


h=input('Please enter the value of h =');
%%%   h=.1, .2

xspan=[0+h 2-h];
x=xspan(1):h:xspan(2);

alfa = 1;
beta = 1;
M = length(x);
a=1+zeros(1,M)';
c=a;

Y = 1+zeros(1,M);
r = zeros(1,M);

i=1;
myeps=1;

while myeps>= 1e-6
    
    Yold=Y;
    fun1 = @mohsen_hw8_p10_fun;
    
    for n=1:M
        b(n) = -2-2*(h^2)*feval( fun1,x(n),Yold(n));
    end
    
    b=b';
    
    fun = @mohsen_hw8_p8_fun;
    
    for n = 2:length(x)-1
        
        r(n) = Yold(n+1) - 2*Yold(n)+ Yold(n-1) - (h^2)*feval( fun,x(n), Yold(n) );
    end
    
    r(1) = Yold(2) - 2*Yold(1)+ alfa - (h^2)*feval( fun,x(1), Yold(1) );
    r(end) = beta - 2*Yold(length(x))+ Yold(length(x)-1) - (h^2)*feval( fun,x(length(x)), Yold(length(x)) );
    
    r=r';
    error  = thomas(a,b,c,r);
    
    Y=Yold-error;
    
    myeps=norm(Y - Yold,inf);
    
    m(i)=myeps;
    
    
    if i > 1000
        disp('iterations do NOT converge !')
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
title(['Newton–Raphson Method. h= ',num2str(h)])
xlabel('x');ylabel('Solution');

subplot(1,2,2)
semilogy(m)
grid on
title('Error of the Newton–Raphson Method')
xlabel('Iteration');ylabel('Error');
