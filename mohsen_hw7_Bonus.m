%-----Homework#7---Problem Bonus---------

clear all
clc

a=0;
b=1.62;

beta = -2.24;
alfa=1;

hd=b/2;  % set the half of the interval, b/2
l=[0 hd];%[0 b/2]
m=[hd b];%[b/2 b]
xspan1=l;
xspan2=m;

h=0.01;
x1=xspan1(1):h:xspan1(2);
x2=xspan2(1):h:xspan2(2);

fun=@mohsen_hw7_p4_fun1;

U1(1)=alfa;    % u(a)=alfa
Ud1(1)=0;      % u'(a)=0

for n=1:length(x1)-1
    
    Ub11(n+1) = U1(n) + h*Ud1(n);
    Ub21(n+1) = Ud1(n)+ h*feval( fun,x1(n),U1(n),Ud1(n)) ;
    U1(n+1)   = U1(n) +(h/2)*(Ud1(n) + Ub21(n+1));
    Ud1(n+1)  = Ud1(n)+(h/2)*(  feval( fun,x1(n),U1(n),Ud1(n)) + feval( fun,x1(n),Ub11(n+1),Ub21(n+1)));
    
end

fun=@mohsen_hw7_p4_fun2;

V1(1)=0;    %v(a)=0
Vd1(1)=1;   %v'(a)=1

for n=1:length(x1)-1
    
    Vb11(n+1) = V1(n) + h*Vd1(n);
    Vb21(n+1) = Vd1(n)+ h*feval( fun,x1(n),V1(n),Vd1(n)) ;
    V1(n+1)   = V1(n) +(h/2)*(Vd1(n) + Vb21(n+1));
    Vd1(n+1)  = Vd1(n)+(h/2)*(  feval( fun,x1(n),V1(n),Vd1(n)) + feval( fun,x1(n),Vb11(n+1),Vb21(n+1)));
    
end

%%%%%%%%%%%%%%%%%
fun=@mohsen_hw7_p4_fun1;

U2(1)=0;    
Ud2(1)=0;   

for n=1:length(x2)-1
    
    Ub12(n+1) = U2(n) + h*Ud2(n);
    Ub22(n+1) = Ud2(n)+ h*feval( fun,x2(n),U2(n),Ud2(n)) ;
    U2(n+1)   = U2(n) +(h/2)*(Ud2(n) + Ub22(n+1));
    Ud2(n+1)  = Ud2(n)+(h/2)*(  feval( fun,x2(n),U2(n),Ud2(n)) + feval( fun,x2(n),Ub12(n+1),Ub22(n+1)));
    
end

fun=@mohsen_hw7_p4_fun2;

V2a(1)=1;    
Vd2a(1)=0;   

for n=1:length(x2)-1
    
    Vb12a(n+1) = V2a(n) + h*Vd2a(n);
    Vb22a(n+1) = Vd2a(n)+ h*feval( fun,x2(n),V2a(n),Vd2a(n)) ;
    V2a(n+1)   = V2a(n) +(h/2)*(Vd2a(n) + Vb22a(n+1));
    Vd2a(n+1)  = Vd2a(n)+(h/2)*(  feval( fun,x2(n),V2a(n),Vd2a(n)) + feval( fun,x2(n),Vb12a(n+1),Vb22a(n+1)));
    
end

V2b(1)=0;    
Vd2b(1)=1;   

for n=1:length(x2)-1
    
    Vb12b(n+1) = V2b(n) + h*Vd2b(n);
    Vb22b(n+1) = Vd2b(n)+ h*feval( fun,x2(n),V2b(n),Vd2b(n)) ;
    V2b(n+1)   = V2b(n) +(h/2)*(Vd2b(n) + Vb22b(n+1));
    Vd2b(n+1)  = Vd2b(n)+(h/2)*(  feval( fun,x2(n),V2b(n),Vd2b(n)) + feval( fun,x2(n),Vb12b(n+1),Vb22b(n+1)));
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%

T=inv([V1(length(x1)) -1  0;Vd1(length(x1))  0  -1;0  V2a(length(x2)) V2b(length(x2))])*[-U1(length(x1));-Ud1(length(x1));beta-U2(length(x2))];

W1=U1+T(1)*V1;
W2=U2+T(2)*V2a+T(3)*V2b;

W=[W1(1:end-1) W2];
x=[x1(1:end-1) x2];

Yexact = 1-2*x;

plot(x,Yexact,x,W,'-.r')
grid on, title('Multiple Shooting Method')
legend('Exact Solution','Numerical Solution','location','southwest')
xlabel('X');
ylabel('W');
