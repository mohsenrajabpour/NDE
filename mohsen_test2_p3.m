
%-------- Test 2 -----Problem 3-----
%---Mohsen---

% % This problem is somewhat the same as Problem 6 in Homework #8, but the
% % boundary conditions are different. With some modifications the previous
% % code(HW#8-P6)can be applicable 

clear all
clc

h=0.1;                   %Step Size
xspan=[2 3];             %First point & Last point
x=xspan(1):h:xspan(2)-h;

%A1 & A2 are difined based on equation (8.31) that is
%A1*y(a)+A2*y'(a)=alpha:
A1 = 0;
A2 = 1;

alpha = -15/19;          %Right Boundary Value
beta = 0;                %Left Boundary Value

M = length(x);

c = 1 + zeros(1,M-1);   % The upper diagonal of matrix (8.6)
a = c;                  % The lower diagonal of matrix (8.6)

% Defining the first element of c regarding the first term in left hand side of equation (8.36)
c(1) = 2;

b = -(2-(h^2)*(-2./(x).^2)); % The diagonal of matrix (8.6)

% Defining the first element of b regarding the second term in left hand side of equation (8.36)
b(1) = ((-2+h^2*(-2/(x(1))^2))+2*h*A1/A2);

R = (x-6) ./ x.^2;% It's defined based on the main equation in the problem and equation (8.1)
r = R.*h^2;  % Based on (8.4)

R(1) = (x(1)-6) / x(1)^2;
% Defining the first element of r regarding the right hand side of equation (8.36)
r(1) = (h^2)*R(1) + (2*h*alpha)/A2;

%Thomas Algorithm

y = thomas(a,b,c,r);

y = [y beta];% Adding the last point(boundary condition)
x = xspan(1):h:xspan(2);

%Calculating the exact solution

Yexact = (114.*x - 19.*x.^2 - 5.*x.^3 - 36)./(38.*x);

Error = abs(y-Yexact);

subplot(1,2,1)
plot(x,y,'->b',x,Yexact,'-*r')
grid on, title('Neumann Boundry Condition')
legend('Numerical Solution','Exact Solution','location','northeast')
xlabel('X');
ylabel('Solution');

subplot(1,2,2)
plot(x,Error)
grid on,title('Error of Neumann Boundry Condition')
xlabel('X');
ylabel('Error');