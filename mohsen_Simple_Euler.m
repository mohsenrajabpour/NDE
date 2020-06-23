function [x,Y]=mohsen_Simple_Euler(fun,yint,xspan,h);

Y(1)=yint;
x=xspan(1):h:xspan(2);

for n=1:length(x)-1
    
    Y(n+1)= Y(n) + h*feval(fun,x(n),Y(n)) ;
end