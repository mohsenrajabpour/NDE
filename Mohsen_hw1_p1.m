% This code integrates on [x0,xf] a model equation 
%   y' = a*x + b*y 
% with given constants  a,b  and
% initial condition 
%   y(x0)=y0.
% The integration is done by the simple Euler method.


% Set the parameters of the problem:
a=1;
b=2;

x0=-1; 
xf=1;                          % beginning and ending values of x
h=0.1;                         % step size in x
y0=-1;                          % initial value of y

x=[x0:h:xf];                   % this is the vector of x values


% Solve the equation using the simple Euler method:
y(1)=y0;
for i=1:length(x)-1
    y(i+1)=y(i)+h*(a*y(i));
end

figure(10101);
plot(x,y,'r--','linewidth',2)
