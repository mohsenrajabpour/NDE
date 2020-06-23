%----Homework #3--Problem 4----Mohsen Rajabpour-----

clear all
clc

xspan=[0 pi];        %The span of x values
yint=1;              %Initial value
eloc=1e-4;           %Local Truncation Error

%%---------------------------------------------------------
syms x y

fun(x,y)=sin(y);        %Main function

y3=1;                   %y''', I explained that how I found this value

%%------Equation (3.37) to find step size, h----------------

h=(12*abs(eloc)/abs(y3))^(1/3);   %Finding step size

z=[xspan(1) xspan(1)+h];

[x,Y]=ME_1eq(fun,yint,z,h);     % Calling Modified Euler Method for our function: y'=fun(x,y1,y2)
                                % y1=Y(2) will be drived be the above line and will be used in the next loop
                                
x=xspan(1):h:xspan(2);
for i=2:length(x)-1
    
    %Equation(3.33)
    Yp(i+1) = Y(i) + (1/2) * h * ( 3*double(feval(fun,x(i),Y(i)))-double(feval(fun,x(i-1),Y(i-1))));%Predictor
    fp(i+1)=double(feval(fun,x(i+1),Yp(i+1)));
    Yc(i+1)=Y(i) +(1/2)*h*(double(feval(fun,x(i),Y(i))+fp(i+1))); %Corrector
    
    ec(i+1)=(1/6)*abs(Yp(i+1)-Yc(i+1));      %Error
    
    Y(i+1)=(1/6)*(Yp(i+1)+5*Yc(i+1));        %Equation(3.40)
end

%Using ode45 to see the accuracy of the procedure
ODEFUN=@mohsen_hw3_p4_fun;
TSPAN=xspan;
Y0=yint;

[TOUT,YOUT] = ode45(ODEFUN,TSPAN,Y0);

%%%

plot(x,Y,'*-r',TOUT,YOUT,'o-b');grid on
xlabel('Time'); ylabel('Solution')
title('Predictor-Corrector Method','FontWeight','bold');
legend('Numerical Solution','ode45','Location','SouthEast')

hold on

figure 
plot(x,ec,'r')
grid on
xlabel('Time'); ylabel('Error')
title('Error in Predictor-Corrector Method','FontWeight','bold');

