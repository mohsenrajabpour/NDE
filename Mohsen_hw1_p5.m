% This code integrates on [x0,xf] a model equation
%   v' = -av+g
%   y(x0)=y0.
% The integration is done by the Modified Euler method.

clear all
clc


g=10;
vinf=35.7;           % velocity
a=g/vinf;            % resesitance of air

t0=0;
tf=2;                          % beginning and ending values of t
h=0.2;                         % step size in t
v0=0;                          % initial value of speed

t=[t0:h:tf];                   % this is the vector of x values

v_analytical=(g/a)-exp(-a*t)*g/a;  % analytical

% Solve the equation using the Modified Euler method:

v(1)=v0;

for i=1:length(t)-1
    vbar(i+1)=v(i)+h*(g-a*v(i));
    v(i+1)=0.5*(v(i)+vbar(i+1)+h*(g-a*vbar(i+1)));
    
end

figure(10101);
plot(t,v,'r*-')
hold on
plot(t,v_analytical,'b')


