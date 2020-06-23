%-------- Test 2 -----Problem 2-----
%---Mohsen---

% % This problem is somewhat the same as Problem 1 in Homework #7, but the
% % boundary conditions are different. With some modifications the previous
% % code(HW#7-P1)can be applicable 

clear all
clc

xspan=[2 3];          %First point & Last point
h=0.1;                %Step Size
alpha=-15/19;         %Right Boundary Value
beta=0;               %Left Boundary Value
x=xspan(1):h:xspan(2);

%The First Auxiliary IVP

% Equation (7.5) is used with some modifications, because boundary
% conditions are diffirent

fun=@mohsen_test2_p2_fun1;

%%% The ideas from Problem 1 & 3 in HW #7 can help to specify these value:

U(1)=0;      % u(a)=0 
Ud(1)=alpha; % u'(a)=alpha

%%%

%Modified Euler

for n=1:length(x)-1
    
    Ub1(n+1) = U(n) + h*Ud(n);
    Ub2(n+1) = Ud(n)+ h*feval( fun,x(n),U(n),Ud(n)) ;
    U(n+1)   = U(n) +(h/2)*(Ud(n) + Ub2(n+1));
    Ud(n+1)  = Ud(n)+(h/2)*(  feval( fun,x(n),U(n),Ud(n)) + feval( fun,x(n),Ub1(n+1),Ub2(n+1)));
    
end

%The Second Auxiliary IVP

% Equation (7.6) is used with some modifications, because boundary
% conditions are diffirent

fun=@mohsen_test2_p2_fun2;

%%% The ideas from Problem 1 & 3 in HW #7 can help to specify these value:
V(1)=1;    %v(a)=1
Vd(1)=0;   %v'(a)=0
%%%

%Modified Euler

for n=1:length(x)-1
    
    Vb1(n+1) = V(n) + h*Vd(n);
    Vb2(n+1) = Vd(n)+ h*feval( fun,x(n),V(n),Vd(n)) ;
    V(n+1)   = V(n) +(h/2)*(Vd(n) + Vb2(n+1));
    Vd(n+1)  = Vd(n)+(h/2)*(feval( fun,x(n),V(n),Vd(n)) + feval( fun,x(n),Vb1(n+1),Vb2(n+1)));
    
end

lp = length(x);              % The value of last point
theta0 = (beta-U(lp))/V(lp); % Equation (7.11)

W  = U + theta0*V;           % Equation (7.19)
Wd = Ud + theta0*Vd;

%Calculating the exact solution

for i=1:length(x)
    Yexact(i)=(114*x(i) - 19*x(i)^2 - 5*x(i)^3 - 36)/(38*x(i));
end

subplot(1,2,1)
plot(x,W,'->b',x,Yexact,'-*r')
grid on, title('Shooting Method for a BVP Problem')
legend('Numerical Solution','Exact Solution','location','northeast')
xlabel('X');
ylabel('Solution');

error = abs(W-Yexact); %Error is the difference between the exact solution and numerical solution

subplot(1,2,2)
plot(x,error)
grid on, title('Error')
xlabel('Time');
ylabel('Error');
