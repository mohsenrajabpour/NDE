%---------Homework #4 Problem 1--------------
clear all
clc




x = -3:0.1:3;%The real part of h*lambda
y = -3:0.1:3;%The imaginary part of h*lambda

[x,y] = meshgrid(x,y);
z = x+i*y;% z is equal to h*lambda
R1 = (1 + z + (1/2)*z.^2) ; % The root of Modified Euler
zlevel1 = abs(R1);% The absolute value of the root
contour(x,y,zlevel1,[1 1], 'LineWidth',2);

grid on, title('Stability Region of the Modified Euler Method')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');
