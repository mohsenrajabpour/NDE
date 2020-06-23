%-----Homework#7---Problem 3---------

clear all
clc

xspan = [2 1];
h = -0.02;
x = xspan(1):h:xspan(2);

alfa=1;
beta=0.5;
gamma=0.25;

%The First Auxiliary IVP
fun=@mohsen_hw7_p2_fun1;

U(1)  =0;    %u(b)=0
Ud(1) =beta; %u'(b)=beta
Udd(1)=gamma;%u''(b)=gamma

for n=1:length(x)-1
    
    Ub1(n+1) = U(n)  + h*Ud(n);
    Ub2(n+1) = Ud(n) + h*Udd(n);
    Ub3(n+1) = Udd(n)+ h*feval( fun,x(n),U(n),Ud(n),Udd(n)) ;
    U(n+1)   = U(n)  +(h/2)*(Ud(n) + Ub2(n+1));
    Ud(n+1)  = Ud(n) +(h/2)*(Udd(n) + Ub3(n+1));
    Udd(n+1) = Udd(n)+(h/2)*(  feval( fun,x(n),U(n),Ud(n),Udd(n)) + feval( fun,x(n),Ub1(n+1),Ub2(n+1),Ub3(n+1)));
   
end

%The Second Auxiliary IVP
fun=@mohsen_hw7_p2_fun2;

V(1)  =1;%v(b)=1
Vd(1) =0;%v'(b)=0
Vdd(1)=0;%v''(b)=0

for n=1:length(x)-1
    
    Vb1(n+1)  = V(n)  + h*Vd(n);
    Vb2(n+1)  = Vd(n) + h*Vdd(n);
    Vb3(n+1)  = Vdd(n)+ h*feval( fun,x(n),V(n),Vd(n),Vdd(n)) ;
    V(n+1)    = V(n)  +(h/2)*(Vd(n) + Vb2(n+1));
    Vd(n+1)   = Vd(n) +(h/2)*(Vdd(n) + Vb3(n+1));
    Vdd(n+1)  = Vdd(n)+(h/2)*(  feval( fun,x(n),V(n),Vd(n),Vdd(n)) + feval( fun,x(n),Vb1(n+1),Vb2(n+1),Vb3(n+1)));
   
end

lp=length(x);% The value of last point
theta0 = (alfa-U(lp))/V(lp);% Equation (7.11) with modification as this is shooting from the right


W(1)  =theta0;
Wd(1) =beta;
Wdd(1)=gamma;

W= U+theta0*V;
Wd= Ud+theta0*Vd;
Wdd= Udd+theta0*Vdd;

plot(x,W,x,Wd,'.-r',x,Wdd,'.g')
grid on
title('Shooting Method for BVP from the right point')
legend('W','Derivative of W','Second Derivative of W','location','southeast')
xlabel('X');
ylabel('W,Wd & Wdd');

