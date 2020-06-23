


function [x,Y]=mohsen_cRK(fun,yint,xspan,h);

Y(1)=yint;
x=xspan(1):h:xspan(2);

for n=1:length(x)-1
    
    k1 = h * feval(fun,x(n),Y(n));
    k2 = h * feval(fun,x(n)+h/2,Y(n)+k1/2);
    k3 = h * feval(fun,x(n)+h/2,Y(n)+k2/2);
    k4 = h * feval(fun,x(n)+h,Y(n)+k3);
    
    Y(n+1) = Y(n) + 1/6 * ( k1 + 2*k2 + 2*k3 + k4);
end