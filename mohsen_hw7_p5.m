%------homework#7-----Problem 5-----

clear all
clc

xspan=[0 2];
H=[0.1 0.01];
alfa=1;
beta=1;
columnNames = {'Shallow Solution','Deep Solution'};

%Shooting method for a nonlinear BVP

fun=@mohsen_hw7_p5_fun1;

Y(1)=1;
Theta=[-1 -4;-6 -15];%both ?' and ?''.

for j=1:2
    h=H(j);
    x=xspan(1):h:xspan(2);
    lp=length(x);
    theta=Theta(j,:);
    %Considering the auxiliary IVP
    for i=1:2
        Yd(1)=theta(i);
        
        for n=1:length(x)-1
            
            Yb1(n+1) = Y(n) + h*Yd(n);
            Yb2(n+1) = Yd(n)+ h*feval( fun,x(n),Y(n),Yd(n)) ;
            Y(n+1)   = Y(n) +(h/2)*(Yd(n) + Yb2(n+1));
            Yd(n+1)  = Yd(n)+(h/2)*(  feval( fun,x(n),Y(n),Yd(n)) + feval( fun,x(n),Yb1(n+1),Yb2(n+1)));
            
        end
        Yn(i)=Y(lp);       %Saving Y at the last point in each iteration
        Ftheta(i)=Yn(i)-1; %Equation (7.49)
        
    end
    
    k=2;
    %Equation (7.51) with consideration of prescribed tolerance
    while abs( Ftheta(k) - Ftheta(k-1) )>1e-03
        
        theta(k+1) = theta(k )- Ftheta(k) / ( (Ftheta(k)-Ftheta(k-1)) / (theta(k)-theta(k-1)) );
        k=k+1;
        Yd(1)=theta(k);
        
        for n=1:length(x)-1
            
            Yb1(n+1) = Y(n) + h*Yd(n);
            Yb2(n+1) = Yd(n)+ h*feval( fun,x(n),Y(n),Yd(n)) ;
            Y(n+1)   = Y(n) +(h/2)*(Yd(n) + Yb2(n+1));
            Yd(n+1)  = Yd(n)+(h/2)*(  feval( fun,x(n),Y(n),Yd(n)) + feval( fun,x(n),Yb1(n+1),Yb2(n+1)));
            
        end
        
        Yn(k)=Y(lp);
        Ftheta(k)=Yn(k)-1;
        
    end
    subplot(1,2,j);
    plot(x,Y)
    grid on,
    xlabel('X');
    ylabel('Y');
    Tit=columnNames{j};
    title([ num2str(Tit) ])
end
