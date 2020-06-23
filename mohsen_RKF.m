


function [x,Ye,Y]=mohsen_RKF(fun,yint,xspan,h);

x=xspan(1):h:xspan(2);
eloc=1e-3*(1600/3600);
Y(1)=yint;
Ye(1)=yint;
k=.8;
n=1;
x1=x(1);

while x1<4 &  n<97
    
    k1 = h * feval (fun, x(n), Y(n));
    k2 = h * feval (fun, x(n) + h/4, Y(n) + k1/4);
    k3 = h * feval (fun, x(n) + (3/8)*h, Y(n) + (3/32)*k1 + (9/32)*k2);
    k4 = h * feval (fun, x(n) + (12/13)*h, Y(n) + (1932/2197)*k1 - (7200/2197)*k2 + (7296/2197)*k3);
    k5 = h * feval (fun, x(n) + h, Y(n) + (439/216)*k1 - 8*k2 + (3680/513)*k3 - (845/4104)*k4);
    k6 = h * feval (fun, x(n) + h/2, Y(n) - (8/27)*k1 + 2*k2 + (3544/2565)*k3 + (1859/4104)*k4 - (11/40)*k5);
    
    Y(n+1)  = Ye(n) + ( (25/216)*k1 + (1408/2565)*k3 + (2197/4104)*k4 - (1/5)*k5);
    Ye(n+1) = Ye(n) + ( (16/135)*k1 + (6656/12825)*k3 + (28561/56430)*k4 - (9/50)*k5 + (2/55)*k6);
    
    e(n+1) = abs(Ye(n+1)-Y(n+1));
    
    
    
    if e(n+1)<eloc
        
        x1=x1+h;
        h = h*k*(eloc/e(n+1))^(1/5);
        
        if h<1e-6
            h=1e-6;
        elseif h>.5
            h=.5;
        end
        
        n=n+1;
    else
        h = h*k*(eloc/e(n+1))^(1/5);
        
        if h<1e-6
            h=1e-6;
            
        elseif h>.5
            h=.5;
        end
        
    end
    
end



