%-----Homework#7---Problem 6---------

clear all
clc

global lambda

R=10;
c=1;
xspan=[-R R];
Y(1)=exp(-c*R);
delta = 0.01;% Variation of lambda

lambda = 0.1;

%Set Absolute Tolerance of ODE45
at=0.002;
options=odeset('AbsTol',at);

fun=@mohsen_hw7_p6_fun1;

i=1;
V(1) = lambda*Y(1);
[t_ode45, y_ode45] = ode45(fun,xspan,[Y(1) V(1)],options);
Z(i) = y_ode45(end,1)

i=2;
lambda = lambda + delta;
V(1) = lambda*Y(1);
[t_ode45, y_ode45] = ode45(fun,xspan,[Y(1) V(1)],options);
Z(i) = y_ode45(end,1);

while Z(i)*Z(i-1)>0
    
    i=i+1;
    lambda = lambda + delta;
    V(1) = lambda*Y(1);
    [t_ode45, y_ode45] = ode45(fun,xspan,[Y(1) V(1)],options);
    Z(i) = y_ode45(end,1);
    
end

LambdaOld = lambda - delta;
LambdaStar = (LambdaOld*Z(i)-(lambda)*Z(i-1))/(Z(i)-Z(i-1))

lambda = LambdaStar;
V(1) = lambda*Y(1);
[t_ode45, y_ode45] = ode45(fun,xspan,[Y(1) V(1)],options);
Zn = y_ode45(end,1);


x = t_ode45;
Yexact = 0.5*sech(x);
Y = y_ode45(:,1);
plot(x,Yexact,'*-b',x,Y,'.-r')
grid on, title('Shooting Method for Finding Discrete Eigenvalue')
legend('Exact Solution','Numerical Solution','location','northeast')
xlabel('X');
ylabel('Numerical Solution and Exact Solution');



