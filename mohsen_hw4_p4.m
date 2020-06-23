%---------------Homework 4----Problem 4------------------
clear all
clc

x = -1.5:0.01:1;%The real part of h*lambda
y = -1:0.01:1;%The imaginary part of h*lambda

[x,y] = meshgrid(x,y);

z = x+i*y;% z is equal to h*lambda
R1 = (1/2) * ( 1 + (3/2)*z + sqrt(  (1+(3/2)*z).^2 - 2*z  ));% The first root of 2nd-order Adams–Bashforth Method
zlevel1 = abs(R1);% The absolute value of the first root
contour(x,y,zlevel1,[1 1], 'LineWidth',2);

hold on

R2 = (1/2) * ( 1 + (3/2)*z - sqrt(  (1+(3/2)*z).^2 - 2*z  ));% The second root of 2nd-order Adams–Bashforth Method
zlevel2 = abs(R2);% The absolute value of the second root
contour(x,y,zlevel2,[1 1],'LineWidth',2);
grid on, title('Stability Region of the 2nd-order Adams–Bashforth Method')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');