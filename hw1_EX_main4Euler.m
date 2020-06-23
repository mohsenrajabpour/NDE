% This code integrates on [x0,xf] a model equation 
%   y' = a*x + b*y 
% with given constants  a,b  and
% initial condition 
%   y(x0)=y0.
% The integration is done by the simple Euler method.

global a b           % This makes parameters  a,b  available to all functions.
                     %  (Without declaring variables to be global, they are
                     %   not "seen" by function files; they are seen only by
                     %   "regular" (i.e. those that don't start with the function declaration)
                     %   M-files. 

% Set the parameters of the problem:
a=1;
b=2;

x0=0; 
xf=1;                          % beginning and ending values of x
h=0.1;                         % step size in x
y0=3;                          % initial value of y

xspan=[x0 xf];                 % this is the span of x values


% Solve the equation using the simple Euler method:
[x_E, y_E] = hw1_EX_Euler_callsfun( @fun4_hw1_EX_main4Euler, xspan, h, y0);
                               % This invokes the function  hw2_EX_Euler,
                               %  which runs the simple Euler method to integrate the
                               %  function supplied in the function file  fun4_hw2_EX.m
      %  Thus, this main code invokes  hw2_EX_Euler.m,
      %   which in turn invokes   fun4_hw2_EX.m.
      
figure(10401);
plot(x_E, y_E, 'mo','markersize',5)
