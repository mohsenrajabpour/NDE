%-----Homework#7---Problem 1---------

clear all
clc

xspan=[0 2];
h=0.1;
alfa=1;
beta=5;
x=xspan(1):h:xspan(2);

%The First Auxiliary IVP
fun=@mohsen_hw7_p1_fun1;

U(1)=alfa;  % u(a)=alfa
Ud(1)=0; % u'(a)=0

for n=1:length(x)-1
    
    Ub1(n+1) = U(n) + h*Ud(n);
    Ub2(n+1) = Ud(n)+ h*feval( fun,x(n),U(n),Ud(n)) ;
    U(n+1)   = U(n) +(h/2)*(Ud(n) + Ub2(n+1));
    Ud(n+1)  = Ud(n)+(h/2)*(  feval( fun,x(n),U(n),Ud(n)) + feval( fun,x(n),Ub1(n+1),Ub2(n+1)));
    
end

%The Second Auxiliary IVP
fun=@mohsen_hw7_p1_fun2;

V(1)=0;  %v(a)=0
Vd(1)=1; %v'(a)=1

for n=1:length(x)-1
    
    Vb1(n+1) = V(n) + h*Vd(n);
    Vb2(n+1) = Vd(n)+ h*feval( fun,x(n),V(n),Vd(n)) ;
    V(n+1)   = V(n) +(h/2)*(Vd(n) + Vb2(n+1));
    Vd(n+1)  = Vd(n)+(h/2)*(  feval( fun,x(n),V(n),Vd(n)) + feval( fun,x(n),Vb1(n+1),Vb2(n+1)));
    
end

lp=length(x); % The value of last point
theta0 = (beta-U(lp))/V(lp) % Equation (7.11)

% An IVP that is the same as the main BVP but we know the value of w' at x=a 
fun=@mohsen_hw7_p1_fun1;

W(1)=alfa;       %w(a)=alfa
Wd(1)=theta0;    %w'(a)=theta

W = U + theta0*V;
Wd = Ud + theta0*Vd;

plot(x,W)
grid on, title('Shooting Method for the Dirichlet Problem of a linear BVP')
xlabel('X');
ylabel('W');