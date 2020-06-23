


function [x,Y]=mohsen_Implicit(fun,yint,xspan,h);

global a b

Y(1)=yint;
x=xspan(1):h:xspan(2);

for n=1:length(x)-1
    
    Y(n+1) = (Y(n) + h*b)/(1-h*a);
end