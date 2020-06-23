%---------------Homework 4----Problem 2------------------
clear all
clc

x = -3:0.01:3;%The real part of h*lambda
y = -3:0.01:3;%The imaginary part of h*lambda

%If lambda is complex

[x,y] = meshgrid(x,y);
z = x+i*y;% z is equal to h*lambda
R1 = (1 + z + (1/2)*z.^2 + (1/6)*z.^3 + (1/24)*z.^4) ; % The root of cRK when lambda is complex
zlevel1 = abs(R1);% The absolute value of the root
figure
contour(x,y,zlevel1,[1 1], 'LineWidth',2);
hold on
plot(-2.79,0,'ro')
datacursormode on
grid on, title('Stability Region of the cRK Method (lambda is complex)')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');

%If lambda is real

hlambda=-3:.1:1;
R = 1 + hlambda + .5*hlambda.^2 + (1/6)*hlambda.^3 + (1/24)*hlambda.^4;% The root of cRK when lambda is real
figure
plot(hlambda,R)
hold on

plot(-2.79,1,'ro')% Indicate the point (-2.79,1)
plot(0,1,'ro')% Indicate the point (0,1)
datacursormode on
grid on, title('lambda is real')
xlabel('h*lambda');