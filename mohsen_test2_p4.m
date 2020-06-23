%-------- Test 2----- Problem 4
%-------- Mohsen

% % It is possible to use the codes for Problem 10 in Homework #8 and Problem 6 in Homework #7 
% % with some modifications

clear all
clc


global lambda

h=.05;                  %Step Size
xspan=[-15+h 15-h];     %First point & Last point
x=xspan(1):h:xspan(2);

alfa = 0;               %Right Boundary Value
beta = 0;               %Left Boundary Value
M = length(x);
a=1+zeros(1,M)';       % The lower diagonal of matrix (8.53)
c=a;                   % The upper diagonal of matrix (8.53)

%%% This part is just for selecting the value of lambda and specifying the initial
%%% guess

S=input('Enter "1" to see the results for lambda=2.25 or enter "2" to see the results for lambda=.778==>');

if S==1
    lambda = 2.25;    %the value of lambda in the nonlinear BVP in the first case
    Y =exp(-x.^2);    %Initial guess for the first case
elseif S==2
    lambda = 0.778;   %the value of lambda in the nonlinear BVP in the second case
    Y =x.*exp(-x.^2); %Initial guess for the second case
end

%%%

r = zeros(1,M);
i=1;
myeps=1;

while myeps>= 1e-9 %Specifying the accuracy
    
    Yold=Y;
    %%%%The calculation for this part is attached
    fun1 = @mohsen_test2_p4_fun2;
    
    for n=1:M
        b(n) = -2-(h^2)*feval( fun1,x(n),Yold(n));
    end
    
    b=b';
    
    fun = @mohsen_test2_p4_fun1;
    
    for n = 2:length(x)-1
        
        r(n) = Yold(n+1) - 2*Yold(n)+ Yold(n-1) - (h^2)*feval( fun,x(n), Yold(n) );
    end
    
    %%%%
    
    r(1) = Yold(2) - 2*Yold(1)+ alfa - (h^2)*feval( fun,x(1), Yold(1) );
    r(end) = beta - 2*Yold(length(x))+ Yold(length(x)-1) - (h^2)*feval( fun,x(length(x)), Yold(length(x)) );
    
    r=r';
    error  = thomas(a,b,c,r);%Thomas Algorithm
    
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

Y=[alfa Y beta];% Adding the first & last points(boundary conditions)
x=-15:h:15;

subplot(1,2,1)
plot(x,Y)
grid on
title(['Newton–Raphson Method. h= ',num2str(h),' ,lambda= ',num2str(lambda)])
xlabel('x');ylabel('Solution');

subplot(1,2,2)
semilogy(m)
grid on
title('Error in the Newton–Raphson Method')
xlabel('Iteration');ylabel('Error');
