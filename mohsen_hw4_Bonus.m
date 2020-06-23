%---------------Homework 4----Problem Bonus------------------
clear all
clc

x = -2.5:0.01:2;%The real part of h*lambda
y = -2:0.01:2;%The imaginary part of h*lambda

[x,y] = meshgrid(x,y);

z = x+i*y;% z is equal to h*lambda
R1 = (1/2) * ( (1 + (1/2)*z + z.^2) + sqrt(  (1 + (1/2)*z + z.^2).^2 + 2*z  ));
zlevel1 = abs(R1);% The absolute value of the first root
contour(x,y,zlevel1,[1 1], 'LineWidth',2);

hold on

R2 = (1/2) * ( (1 + (1/2)*z + z.^2) - sqrt(  (1 + (1/2)*z + z.^2).^2 + 2*z  ));
zlevel2 = abs(R2);% The absolute value of the second root
contour(x,y,zlevel2,[1 1],'LineWidth',2);
grid on, title('Stability Region of the 2nd-order Adams–Bashforth Method')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');


% 1.Predictor

R3 =  ( z + sqrt(  (z).^2 +1  ));
zlevel3 = abs(R3);

contour(x,y,zlevel3,[1 1], 'LineWidth',2);

hold on

R4 =  ( z - sqrt(  (z).^2 +1  ));
zlevel4 = abs(R4);
contour(x,y,zlevel4,[1 1], 'r','LineWidth',2);

hold on
%2.Corrector
R5=(2+z)./(2-z);
zlevel5 = abs(R5);
contour(x,y,zlevel5,[1 1],'b', 'LineWidth',2);
grid on, title('Using Leap Frog in Predictor and Corrector Methods')

xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');