%-----Homework#7---Problem 2---------

clear all
clc

xspan=[1 2];
h=0.02;
x=xspan(1):h:xspan(2);

alfa=1;
beta=0.5;
gamma=0.25;

%The First Auxiliary IVP
fun=@mohsen_hw7_p2_fun1;

U(1)  =alfa;% u(a)=alfa
Ud(1) =0;   % u'(a)=0
Udd(1)=0;   % u''(a)=0

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

V(1)  =0;%v(a)=0
Vd(1) =1;%v'(a)=1
Vdd(1)=0;%v''(a)=0

for n=1:length(x)-1
    
    Vb1(n+1)  = V(n)  + h*Vd(n);
    Vb2(n+1)  = Vd(n) + h*Vdd(n);
    Vb3(n+1)  = Vdd(n)+ h*feval( fun,x(n),V(n),Vd(n),Vdd(n)) ;
    V(n+1)    = V(n)  +(h/2)*(Vd(n) + Vb2(n+1));
    Vd(n+1)   = Vd(n) +(h/2)*(Vdd(n) + Vb3(n+1));
    Vdd(n+1)  = Vdd(n)+(h/2)*(  feval( fun,x(n),V(n),Vd(n),Vdd(n)) + feval( fun,x(n),Vb1(n+1),Vb2(n+1),Vb3(n+1)));
   
end


fun=@mohsen_hw7_p2_fun2;

W(1)  =0;%w(a)=0
Wd(1) =0;%w'(a)=0
Wdd(1)=1;%w''a)=1

for n=1:length(x)-1
    
    Wb1(n+1) = W(n)  + h*Wd(n);
    Wb2(n+1) = Wd(n) + h*Wdd(n);
    Wb3(n+1) = Wdd(n)+ h*feval( fun,x(n),W(n),Wd(n),Wdd(n)) ;
    W(n+1)   = W(n)  +(h/2)*(Wd(n) + Wb2(n+1));
    Wd(n+1)  = Wd(n) +(h/2)*(Wdd(n) + Wb3(n+1));
    Wdd(n+1) = Wdd(n)+(h/2)*(  feval( fun,x(n),W(n),Wd(n),Wdd(n)) + feval( fun,x(n),Wb1(n+1),Wb2(n+1),Wb3(n+1)));
   
end


lp=length(x);% The value of last point
T = inv([Vd(lp) Wd(lp);Vdd(lp) Wdd(lp)])*[beta-Ud(lp) gamma-Udd(lp)]';%Equation (7.30), to find theta and phi

%Construct z that is u+theta*v+phi*w

Z(1)  =1;
Zd(1) =T(1);%T(1)=theta
Zdd(1)=T(2);%T(2)=phi


Z= U+T(1)*V+T(2)*W;
Zd= Ud+T(1)*Vd+T(2)*Wd;
Zdd= Udd+T(1)*Vdd+T(2)*Wdd;

plot(x,Z,x,Zd,'.-r',x,Zdd,'.g')
grid on, title('Shooting Method for BVP')
legend('Z','Derivative of Z','Second Derivative of Z','location','southeast')
xlabel('X');
ylabel('Z,Zd & Zdd');
