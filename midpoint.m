% Function for Midpoint Method for the equation:
% y'=fun(x,y1,y2)
%
% the user must input fun, initial value  for y,
% a 2-dimensional vector for xspan, and the desired step size.


function [x,Y]=midpoint(fun,yint,xspan,h);

Y(1)=yint;
x=xspan(1):h:xspan(2);

for n=1:length(x)-1
    Ybar=Y(n)+h/2*feval(fun,x(n),Y(n));
    Y(n+1)=Y(n)+h*feval(fun,x(n)+h/2,Ybar);
end