% Function applying the simple Euler method to a given equation
%                   y' = fun(x,y) 
%
% The user must specify:
%  -  the function  fun; 
%  -  the integration span  xspan (a 2-component vector);
%  -  the integration step size  h;  and
%  -  the initial value,  y_init,  for y.

function [X,Y] = hw1_EX_Euler_callsfun(fun, xspan, h, y_init);

Y(1) = y_init;
X = xspan(1) :h: xspan(2);

for n = 1 : length(X)-1
    Y(n+1) = Y(n) + h*feval(fun, X(n), Y(n));
end