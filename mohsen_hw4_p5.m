%---------------Homework 4----Problem 5------------------
clear all
clc

x = -3:0.01:1;%The real part of h*lambda
y = -2:0.01:2;%The imaginary part of h*lambda

[x,y] = meshgrid(x,y);

z = x+i*y;% z is equal to h*lambda
R1 = (1/2) * ( (1 + z +(3/4)*z.^2) + sqrt(  (1 + z +(3/4)*z.^2).^2 - z.^2  ));;% The first root of Predictor and Corrector Method
zlevel1 = abs(R1);% The absolute value of the first root
contour(x,y,zlevel1,[1 1], 'LineWidth',2);

hold on
R2 = (1/2) * ( (1 + z +(3/4)*z.^2) - sqrt(  (1 + z +(3/4)*z.^2).^2 - z.^2  ));% The second root of Predictor and Corrector Method
zlevel2 = abs(R2);% The absolute value of the second root
contour(x,y,zlevel2,[1 1],'LineWidth',2);
grid on, title('Stability Region of the Predictor and Corrector Method')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');

%%
% If we consider the predictor  and corrector separately and independently with no affecting
% on each other

%1.Predictor

R3 = (1/2) * ( (1 +(3/2)*z) + sqrt(  (1 +(3/2)*z).^2 - 2*z  ));
zlevel3 = abs(R3);

figure

contour(x,y,zlevel3,[1 1], 'LineWidth',2);

hold on

R4 = (1/2) * ( (1 +(3/2)*z) - sqrt(  (1 +(3/2)*z).^2 - 2*z  ));
zlevel4 = abs(R4);
contour(x,y,zlevel4,[1 1], 'r','LineWidth',2);

hold on

%2.Corrector

R5=(2+z)./(2-z);
zlevel5 = abs(R5);
contour(x,y,zlevel5,[1 1],'b', 'LineWidth',2);
grid on, title('Stability Region of Predictor  and Corrector Separately')
legend('Predictor first root','Predictor second root','Corrector','Location','northwest')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');