clear all
clc

x = -3:0.01:3;
y = -3:0.01:3;

[x,y] = meshgrid(x,y);

z = x+i*y;
R1 = (1/2) * ( (2 - z.^2) + sqrt(  (2 - z.^2).^2 - 4*(1+z.^4/4)  ));
zlevel1 = abs(R1);
contour(x,y,zlevel1,[1 1], 'LineWidth',2);

hold on
R2 = (1/2) * ( (2 - z.^2) - sqrt(  (2 - z.^2).^2 - 4*(1+z.^4/4)  ));
zlevel2 = abs(R2);
contour(x,y,zlevel2,[1 1],'LineWidth',2);
grid on, title('Stability Region of the Modifeid Euler Method')
xlabel('h \lambda_{x}');
ylabel('h \lambda_{i}');
